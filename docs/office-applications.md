# Office and accounting applications

## LibreOffice
Writer, Calc and Impress are included as native Linux applications.

## Microsoft 365 desktop apps and Google Drive for desktop
SUPERIOR OS does not bundle proprietary Windows installers or licences. Microsoft
365 desktop apps and Google Drive for desktop are Windows applications; there
are no official native Linux desktop clients for these products.

For users who need the genuine desktop applications, SUPERIOR OS supports an
optional Windows virtual machine (VM). Install the VM host components with:

```bash
sudo bash build/install-windows-vm-support.sh
```

Then sign out and back in, open **Windows Virtual Machine** (Virtual Machine
Manager), and create a Windows 11 VM. Provide your own legitimate Windows ISO
and licence. In the VM, install Microsoft 365 from Microsoft's official account
or installation page and install Google Drive for desktop from Google's
official download page. Sign-in, activation, subscriptions and storage plans
remain subject to each provider's terms.

Official downloads:
- Microsoft 365: https://www.microsoft365.com/ and https://account.microsoft.com/services
- Google Drive for desktop: https://www.google.com/drive/download/
- Windows 11: https://www.microsoft.com/software-download/windows11

For Windows 11, configure UEFI firmware and a TPM 2.0 device in the VM settings.
Use the virtio-win driver ISO if Windows needs storage or network drivers.

## Shared files between Linux and Windows
Create a dedicated shared folder on the Linux host and add it to the VM through
virt-manager. VirtioFS is the preferred high-performance option when supported;
install the matching VirtIO guest driver in Windows. A network share (SMB) is
an alternative. Do not share your entire home directory or sensitive folders.

## Hardware and performance
Virtualization is optional and is not installed in the Core ISO, preserving the
lightweight base. Enable AMD SVM / Intel VT-x in firmware. 8 GB host RAM is a
tight configuration: start with 4 GB RAM for the Windows VM, close heavy Linux
applications, and avoid running multiple VMs. 16 GB or more is recommended for
comfortable simultaneous use. SSD storage is strongly recommended; reserve at
least 80 GB for a Windows 11 VM.

A VM is a real Windows environment, not a compatibility promise from Wine.
GPU-heavy games and some hardware-dependent applications may perform worse
than on native Windows. Keep Windows and its applications updated.

## TallyPrime
The existing TallyPrime launcher opens the official download page. TallyPrime
is proprietary and is not redistributed. For dependable use, install it inside
the Windows VM and validate licence activation, printing, Excel integration
and company-data backups before production use. Keep independent backups.

Official TallyPrime download:
- https://tallysolutions.com/download/
