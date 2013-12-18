#!/usr/bin/env bash

# Check which Packer builder type is being used
if [ $PACKER_BUILDER_TYPE = "virtualbox" ]; then
  # Required for the VirtualBox Guest Additions for Linux
  # http://www.virtualbox.org/manual/ch04.html
  yum install --assumeyes bzip2 dkms gcc kernel-devel make
  
  # Required to prevent VBoxLinuxAdditions.run from throwing (harmless) errors
  yum install --assumeyes which
  
  # Install the VirtualBox Guest Additions
  mkdir /mnt/cdrom
  mount /root/VBoxGuestAdditions.iso /mnt/cdrom
  sh /mnt/cdrom/VBoxLinuxAdditions.run
  
  # Cleanup
  umount /mnt/cdrom
  rmdir /mnt/cdrom
  rm --force /root/VBoxGuestAdditions.iso
      
  # Fix permissions and SELinux context for Packer’s virtualbox_version_file
  chmod 0644 /etc/virtualbox-version
  chcon system_u:object_r:etc_t:s0 /etc/virtualbox-version
fi
