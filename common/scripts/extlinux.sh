#!/usr/bin/env bash

# Set the timeout for the EXTLINUX bootloader to 1/10 second
sed --in-place 's/^timeout 50$/timeout 1/' /boot/extlinux/extlinux.conf
