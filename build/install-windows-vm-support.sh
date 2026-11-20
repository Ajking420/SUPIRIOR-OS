#!/usr/bin/env bash
set -Eeuo pipefail

# Optional feature: keep virtualization out of the 2 GB Core ISO.
if [[ "${EUID}" -ne 0 ]]; then
  echo "Run with sudo: sudo bash $0" >&2
  exit 1
fi

if ! command -v apt-get >/dev/null 2>&1; then
  echo "This helper currently supports Debian-based SUPERIOR OS only." >&2
  exit 1
fi

if ! grep -Eq '(vmx|svm)' /proc/cpuinfo; then
  echo "Hardware virtualization (Intel VT-x / AMD-V) is not visible." >&2
  echo "Enable Intel VT-x or AMD SVM in firmware/BIOS, then run this helper again." >&2
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends \
  qemu-system-x86 qemu-utils \
  libvirt-daemon-system libvirt-clients \
  virt-manager ovmf swtpm swtpm-tools \
  dnsmasq-base bridge-utils \
  spice-vdagent virtiofsd

systemctl enable --now libvirtd

TARGET_USER="${SUDO_USER:-}"
if [[ -n "${TARGET_USER}" && "${TARGET_USER}" != "root" ]]; then
  usermod -aG libvirt,kvm "${TARGET_USER}"
  echo
  echo "Added ${TARGET_USER} to the libvirt and kvm groups."
  echo "Log out and back in before launching Virtual Machine Manager."
else
  echo "Packages installed. Add your desktop user to the libvirt and kvm groups."
fi

echo
echo "Windows VM support is installed. No Windows image or licence was downloaded."
echo "Launch Virtual Machine Manager from the Applications menu."
