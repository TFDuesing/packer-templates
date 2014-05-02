#!/usr/bin/env bash

# Check which Packer builder type is being used
if [ $PACKER_BUILDER_TYPE = "vmware-iso" ]; then
  # Required for VMware Tools for Linux Guests
  # http://pubs.vmware.com/fusion-6/topic/com.vmware.fusion.help.doc/GUID-08BB9465-D40A-4E16-9E15-8C016CC8166F.html
  yum install --assumeyes tar perl net-tools make gcc kernel-devel
  
  # Install the VirtualBox Guest Additions
  mkdir /mnt/cdrom
  mount /root/linux.iso /mnt/cdrom
  tar -zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp
  /tmp/vmware-tools-distrib/vmware-install.pl --default
  
  # Cleanup
  umount /mnt/cdrom
  rmdir /mnt/cdrom
  rm --force /root/linux.iso
  rm --force --recursive /tmp/vmware*
fi
