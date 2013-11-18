#!/usr/bin/env bash

# Remove MAC address and UUID from non-loopback interface configuration files
sed --in-place '/^HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth*
sed --in-place '/^UUID/d' /etc/sysconfig/network-scripts/ifcfg-eth*

# Tell udev to disable the assignment of fixed network interface names
# http://www.freedesktop.org/wiki/Software/systemd/PredictableNetworkInterfaceNames/
ln -s /dev/null /etc/udev/rules.d/80-net-name-slot.rules
