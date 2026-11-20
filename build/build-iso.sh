#!/usr/bin/env bash
set -Eeuo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${ROOT_DIR}/out"
cd "${ROOT_DIR}"

if [[ "${EUID}" -ne 0 ]]; then
  echo "Run with sudo: sudo $0" >&2
  exit 1
fi

for cmd in lb debootstrap mksquashfs xorriso; do
  command -v "${cmd}" >/dev/null 2>&1 || {
    echo "Missing build dependency: ${cmd}" >&2
    exit 1
  }
done

mkdir -p "${OUT_DIR}"
lb clean --purge || true

lb config \
  --distribution trixie \
  --architectures amd64 \
  --binary-images iso-hybrid \
  --archive-areas "main contrib non-free non-free-firmware" \
  --apt-recommends false \
  --debian-installer false

lb build

shopt -s nullglob
images=( "${ROOT_DIR}"/*.iso )
if (( ${#images[@]} == 0 )); then
  echo "Build completed but no ISO was found." >&2
  exit 1
fi

for image in "${images[@]}"; do
  mv -f -- "${image}" "${OUT_DIR}/"
done

(
  cd "${OUT_DIR}"
  sha256sum ./*.iso > SHA256SUMS
)

echo "SUPERIOR OS ISO build complete:"
ls -lh "${OUT_DIR}"
