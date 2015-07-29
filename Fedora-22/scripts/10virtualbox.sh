#!/usr/bin/env sh

# Check which Packer builder type is being used
if [ $PACKER_BUILDER_TYPE = "virtualbox-iso" ]; then
  # Required for the VirtualBox Guest Additions for Linux
  # http://www.virtualbox.org/manual/ch04.html
  dnf install --assumeyes bzip2 dkms kernel-devel

  # Install the VirtualBox Guest Additions
  mkdir /mnt/cdrom
  mount /root/VBoxGuestAdditions.iso /mnt/cdrom
  sh /mnt/cdrom/VBoxLinuxAdditions.run

  # Disable VirtualBox X11 Guest Additions
  systemctl disable vboxadd-x11.service

  # Cleanup
  dnf remove --assumeyes bzip2 dkms kernel-devel
  umount /mnt/cdrom
  rmdir /mnt/cdrom
  rm --force /root/VBoxGuestAdditions.iso

  # Fix permissions and SELinux context for Packer’s virtualbox_version_file
  chmod 0644 /root/virtualbox-version
  chcon system_u:object_r:admin_home_t:s0 /root/virtualbox-version
fi
