#!/usr/bin/env bash

# Remove MAC addresse and UUID from non-loopback interface configuration files
sed --in-place=.original '/^HWADDR/d' /etc/sysconfig/network-scripts/ifcfg-eth*
sed --in-place=.original '/^UUID/d' /etc/sysconfig/network-scripts/ifcfg-eth*
