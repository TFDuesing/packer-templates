#!/usr/bin/env sh

# Remove UUID from non-loopback interface configuration files
sed --in-place '/^UUID/d' /etc/sysconfig/network-scripts/ifcfg-eth*

# Remove random-seed, so it’s not the same in every image
rm --force /var/lib/systemd/random-seed

# Truncate machine-id, for the same reasons random-seed is removed
# Note: this image will not boot if /etc/machine-id is not present, but systemd
# will generate a new machine ID if /etc/machine-id is present but empty
truncate --size=0 /etc/machine-id

# Clean up old dnf repo data & logs
dnf clean all
rm --recursive --force /var/lib/dnf/history/*
rm --recursive --force /var/lib/dnf/yumdb/*
truncate --no-create --size=0 /var/log/dnf.*

# Force the filesystem to reclaim space from deleted files
dd if=/dev/zero of=/var/tmp/zeros bs=1M
rm --force /var/tmp/zeros
