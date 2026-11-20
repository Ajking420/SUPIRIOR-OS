# SUPERIOR OS architecture

## Base
- Debian 13 (Trixie), AMD64 first.
- XFCE for the Core edition; KDE Plasma can be offered as an optional richer desktop.
- Debian packages remain the host package manager.

## Compatibility layers
- Windows: Wine for applications, Proton for supported games, Bottles for prefix management.
  Some Windows programs, kernel drivers and anti-cheat systems will not work.
- Linux distributions: Distrobox/Podman containers for Ubuntu, Arch and Kali.
  Never mix foreign distro package managers into the host root filesystem.
- Android: Waydroid is the initial integration research track. Android 17 requires
  a compatible image and tested Binder, graphics, audio, networking and input support.
- Google Play: only through an appropriately licensed and certified solution.

## Editions
- Core: lightweight desktop; heavy runtimes not started by default.
- Standard: optional Wine, Distrobox and developer tools.
- Ultimate: optional gaming and Android components.

## Security
- Signed APT repository metadata and release checksums.
- Never auto-execute downloaded EXE/MSI/APK files.
- Clearly disclose app sources and privilege requests.
- Run Kali tools in an isolated environment.
