#!/usr/bin/env bash

# Delete and lock root password
passwd --delete root
passwd --lock root
