#!/usr/bin/env bash

# Document box build time
echo 'Built by Packer at' $(date '+%H:%M %Z on %B %-d, %Y') \
    > /etc/image-build-time
chmod 0644 /etc/image-build-time
chcon system_u:object_r:etc_t:s0 /etc/image-build-time
