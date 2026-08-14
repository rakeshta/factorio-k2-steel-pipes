import fs from 'fs';
import path from 'path';
import { exec } from 'child_process';

const ROOT_FOLDER = path.normalize(path.join(__dirname, '..'));
const SOURCE_GRAPHICS_FOLDER = ROOT_FOLDER + '/__source_graphics__';
const DEST_GRAPHICS_FOLDER = ROOT_FOLDER + '/graphics';

const ASSETS_FOLDER = ROOT_FOLDER + '/assets';

const CUSTOM_ASSETS = ['icons/casting-pipe.png', 'icons/casting-pipe-to-ground.png'];

async function main(): Promise<void> {
  // check source folder
  if (!fs.existsSync(SOURCE_GRAPHICS_FOLDER)) {
    console.error(`Source folder ${SOURCE_GRAPHICS_FOLDER} does not exist`);
    return;
  }

  // start processing at the root of the source graphics folder
  await processDirectory();

  // copy custom assets
  await copyCustomAssets();
}
main();

async function processDirectory(subDir?: string): Promise<void> {
  const baseDir = SOURCE_GRAPHICS_FOLDER;
  const dir = subDir ? path.join(baseDir, subDir) : baseDir;
  for (const file of fs.readdirSync(dir, { withFileTypes: true })) {
    const subPath = subDir ? path.join(subDir, file.name) : file.name;
    // Factorio 2.1 pumps use vanilla wagon_connection_graphics.
    if (subPath === 'pump/connector') {
      continue;
    }
    if (file.isDirectory()) {
      await processDirectory(subPath);
    } else if (subPath.endsWith('.png')) {
      await processGraphic(subPath);
    } else {
      console.log(`Skipping ${subPath}`);
    }
  }
}

async function processGraphic(subPath: string): Promise<void> {
  console.log(`Processing ${subPath}`);

  // form paths
  const sourcePath = path.join(SOURCE_GRAPHICS_FOLDER, subPath);
  const destPath = path.join(DEST_GRAPHICS_FOLDER, subPath);

  // ensure the destination directory exists
  const destDir = path.dirname(destPath);
  fs.mkdirSync(destDir, { recursive: true });

  // use sips to convert the image to grayscale
  return new Promise<void>((resolve, reject) =>
    exec(sipsCommand({ sourcePath, destPath }), (error, stdout, stderr) => {
      if (error) {
        console.error(`Error processing ${subPath}: ${error.message}`);
        reject();
      }
      if (stderr) {
        console.error(`Error processing ${subPath}: ${stderr}`);
        reject();
      }
      console.log(`  Wrote ${destPath}`);
      resolve();
    })
  );
}

function sipsCommand({ sourcePath, destPath }: { sourcePath: string; destPath: string }): string {
  return `
  sips -s format png --matchTo '/System/Library/ColorSync/Profiles/Generic Gray Gamma 2.2 Profile.icc' ${sourcePath} --out ${destPath}
  `;
}

async function copyCustomAssets(): Promise<void> {
  // copy assets from a list to matching destination
  for (const asset of CUSTOM_ASSETS) {
    console.log(`Copying ${asset}`);

    // form paths
    const sourcePath = path.join(ASSETS_FOLDER, asset);
    const destPath = path.join(DEST_GRAPHICS_FOLDER, asset);

    // ensure folder exists
    fs.mkdirSync(path.dirname(destPath), { recursive: true });

    // copy asset
    fs.copyFileSync(sourcePath, destPath);
  }
}
