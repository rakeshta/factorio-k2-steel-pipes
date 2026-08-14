#!/bin/bash
#
#  publish.sh
#  factorio-k2-steel-pipes
#
#  Build the mod zip and upload it to the Factorio mod portal.
#  Reads FACTORIO_MOD_API_KEY from .env (see .env.example).
#

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "${ROOT}"

if [[ -f .env ]]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
fi

if [[ -z "${FACTORIO_MOD_API_KEY:-}" ]]; then
  echo "FACTORIO_MOD_API_KEY is not set. Copy .env.example to .env and add a key from https://factorio.com/profile (ModPortal: Upload Mods)." >&2
  exit 1
fi

npm run --silent build

PACKAGE_NAME="$(npm run --silent read-info -- name)"
PACKAGE_VERSION="$(npm run --silent read-info -- version)"
ZIP_FILE="build/${PACKAGE_NAME}_${PACKAGE_VERSION}.zip"

if [[ ! -f "${ZIP_FILE}" ]]; then
  echo "Expected zip not found: ${ZIP_FILE}" >&2
  exit 1
fi

echo "Uploading ${PACKAGE_NAME} ${PACKAGE_VERSION}…"

# Print data[key] from portal JSON on stdin. On error, print message/error and exit 1.
function portal_field() {
  python3 -c '
import json, sys
raw = sys.stdin.read()
try:
    data = json.loads(raw)
except json.JSONDecodeError:
    sys.stderr.write("Portal returned non-JSON:\n" + raw + "\n")
    sys.exit(1)
key = sys.argv[1]
value = data.get(key)
if not value:
    sys.stderr.write((data.get("message") or data.get("error") or raw) + "\n")
    sys.exit(1)
if key == "success":
    print("upload successful")
else:
    print(value)
' "${1}"
}

INIT_JSON="$(
  curl -sS -X POST \
    -H "Authorization: Bearer ${FACTORIO_MOD_API_KEY}" \
    -d "mod=${PACKAGE_NAME}" \
    https://mods.factorio.com/api/v2/mods/releases/init_upload
)"

UPLOAD_URL="$(portal_field upload_url <<<"${INIT_JSON}")"
RESULT_JSON="$(curl -sS -F "file=@${ZIP_FILE}" "${UPLOAD_URL}")"
portal_field success <<<"${RESULT_JSON}"
