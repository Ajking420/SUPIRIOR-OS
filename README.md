# SUPERIOR OS

A Debian 13 (Trixie), AMD64-based Linux distribution project.

## Current milestone: Core 0.1

The first milestone is a bootable Debian Live ISO using a lightweight XFCE desktop.
The project will grow in tested, modular stages.

**This repository is an early development project, not a finished operating system.**
Windows compatibility, Android 17, Google Play integration, distro containers,
custom app store and installer are future milestones.

## Build host

Use Debian 13 or a compatible Debian/Ubuntu-based Linux host. Recommended:
- x86-64 CPU
- 8 GB RAM for building (2 GB is the installed Core edition target)
- 30 GB free disk space
- Internet connection and sudo access

## Build

Install dependencies:

```bash
sudo apt update
sudo apt install -y git live-build debootstrap squashfs-tools xorriso \
  grub-pc-bin grub-efi-amd64-bin mtools dosfstools
```

Clone and build:

```bash
git clone https://github.com/Ajking420/SUPIRIOR-OS.git
cd SUPIRIOR-OS
sudo bash build/build-iso.sh
```

The generated ISO and SHA256 checksum will be in `out/`.

## Test safely

Test the ISO in QEMU or VirtualBox before installing it on physical hardware.
Writing an ISO to a USB drive erases the selected drive.

## Architecture and safety policy

- Debian Stable base, AMD64 first.
- Core edition keeps Android, containers and gaming runtimes optional.
- Wine/Proton support many, but not all, Windows applications.
- Ubuntu, Arch and Kali environments are isolated using containers; do not mix
  their package managers into the host root filesystem.
- Android 17 and Google Play are research/licensing milestones, not currently
  included capabilities.
- Downloaded EXE/MSI/APK files are never executed automatically.
- Release repositories and update metadata must be cryptographically signed.

See [docs/architecture.md](docs/architecture.md) and [docs/roadmap.md](docs/roadmap.md).
