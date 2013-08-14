#!/usr/bin/env bash

# Install setuptools
curl -O https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py
python ez_setup.py

# Install pip
curl -O https://raw.github.com/pypa/pip/master/contrib/get-pip.py
python get-pip.py

# Install pyrax
pip install pyrax

# Cleanup
rm ez_setup.py
rm get-pip.py
rm setuptools-*.tar.gz
