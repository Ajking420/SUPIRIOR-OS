# SUPERIOR OS architecture

## Base
- Debian 13 (Trixie), AMD64 first.
- XFCE for the Core edition; KDE Plasma can be offered as an optional richer desktop.
- Debian packages remain the host package manager.

## Compatibility layers
- Windows: Wine for compatible applications and Proton for supported games.
  Some programs, kernel drivers and anti-cheat systems will not work.
- Full Windows desktop applications: optional KVM/QEMU virtual machine managed
  with virt-manager. Windows, Microsoft 365 and Google Drive installers and
  licences are supplied by the user, not redistributed by SUPERIOR OS.
- Linux distributions: Distrobox/Podman containers for Ubuntu, Arch and Kali.
  Never mix foreign distro package managers into the host root filesystem.
- Android: Waydroid is the initial integration research track. Android 17 requires
  a compatible image and tested Binder, graphics, audio, networking and input support.
- Google Play: only through an appropriately licensed and certified solution.

## Optional Windows VM
The Core ISO stays lean. Users opt in after installation by running
`sudo bash build/install-windows-vm-support.sh`. This installs QEMU/KVM,
libvirt, virt-manager, UEFI firmware and virtual TPM support. The host CPU must
expose AMD-V/SVM or Intel VT-x. Windows 11 guests should use UEFI and TPM 2.0.
Shared host folders should be explicitly configured, preferably with VirtioFS
or a restricted SMB share.

## Editions
- Core: lightweight desktop; virtualization, Android, containers and gaming runtimes optional.
- Standard: optional Wine, Distrobox and developer tools.
- Ultimate: optional gaming and Android components.

## Security
- Signed APT repository metadata and release checksums.
- Never auto-execute downloaded EXE/MSI/APK files.
- Clearly disclose app sources and privilege requests.
- Run Kali tools in an isolated environment.
- Windows guests are isolated by default; share only folders the user chooses.
