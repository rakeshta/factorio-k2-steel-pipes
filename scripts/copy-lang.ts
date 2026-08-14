//
//  copy-lang.ts
//  factorio-k2-steel-pipes
//
//  Created by Rakesh Ayyaswami on 31 Dec 2022.
//

import fs from 'fs';
import ConfigParser from 'configparser';

const K2_LANG_FILE = 'Krastorio2.cfg';
const LANG_FILE = 'lang.cfg';
const LANG_KEYS = ['kr-steel-pipe', 'kr-steel-pipe-to-ground', 'kr-steel-pump', 'kr-steel-fluid-handling'];

const EXTRA_EN: Record<string, Record<string, string>> = {
  'recipe-name': {
    'kr-casting-steel-pipe': 'Casting steel pipe',
    'kr-casting-steel-pipe-to-ground': 'Casting steel pipe to ground',
  },
};

async function main(): Promise<void> {
  const srcFolder = process.argv[2];
  if (!srcFolder) {
    printUsage();
    return;
  }

  if (!fs.existsSync(srcFolder)) {
    console.error(`Source folder ${srcFolder} does not exist`);
    printUsage();
    return;
  }

  // enumerate language folders & copy strings
  const localeFolder = `${srcFolder}/locale`;
  for (const locale of fs.readdirSync(localeFolder, { withFileTypes: true })) {
    if (locale.isDirectory()) {
      await copyLocale(localeFolder, locale.name);
    }
  }

  writeExtraEnStrings();
}
main();

async function copyLocale(localeFolder: string, locale: string): Promise<void> {
  console.log(`Copying ${locale}...`);

  // read the source file
  const config = new ConfigParser();
  config.read(`${localeFolder}/${locale}/${K2_LANG_FILE}`);

  // destination config
  const destConfig = new ConfigParser();
  let isEmpty = true;

  // find keys we want to copy & write to dest
  for (const section of config.sections()) {
    let isSectionAdded = false;
    for (const key of LANG_KEYS) {
      const value = config.get(section, key);
      if (value) {
        console.log(`  ${section}/${key} = ${value}`);

        // add section if required
        if (!isSectionAdded) {
          destConfig.addSection(section);
          isSectionAdded = true;
        }

        // write value
        destConfig.set(section, key, value);
        isEmpty = false;
      }
    }
  }

  // write dest config if not empty
  if (!isEmpty) {
    const destFolder = `locale/${locale}`;
    fs.mkdirSync(destFolder, { recursive: true });

    const destFile = `${destFolder}/${LANG_FILE}`;
    destConfig.write(destFile, true);
  }
}

function writeExtraEnStrings(): void {
  const enFile = `locale/en/${LANG_FILE}`;
  if (!fs.existsSync(enFile)) {
    return;
  }

  const enConfig = new ConfigParser();
  enConfig.read(enFile);
  for (const [section, values] of Object.entries(EXTRA_EN)) {
    if (!enConfig.sections().includes(section)) {
      enConfig.addSection(section);
    }
    for (const [key, value] of Object.entries(values)) {
      enConfig.set(section, key, value);
    }
  }
  enConfig.write(enFile, true);
}

function printUsage(): void {
  console.log('Usage: ts-node copy-lang <krastorio2-folder>');
}
