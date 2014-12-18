#!/usr/bin/env sh

# Create vagrant user, required by Vagrant box specs
# http://docs.vagrantup.com/v2/virtualbox/boxes.html
useradd --user-group vagrant
echo 'vagrant' | /usr/bin/passwd --stdin vagrant

# Give vagrant user permission to sudo
echo 'Defaults:vagrant !requiretty' > /etc/sudoers.d/vagrant
echo '%vagrant ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant
chcon system_u:object_r:etc_t:s0 /etc/sudoers.d/vagrant

# Install Vagrant’s “insecure” public key
mkdir --parents /home/vagrant/.ssh/
curl --location --remote-name \
    https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
mv vagrant.pub /home/vagrant/.ssh/authorized_keys
chown --recursive vagrant:vagrant /home/vagrant/.ssh/
chmod 0700 /home/vagrant/.ssh/
chmod 0600 /home/vagrant/.ssh/authorized_keys
chcon --recursive unconfined_u:object_r:ssh_home_t:s0 /home/vagrant/.ssh/

# Document box build time
echo 'Built by Packer at' $(date '+%H:%M %Z on %B %-d, %Y') \
    > /root/vagrant-box-build-time
chmod 0644 /root/vagrant-box-build-time
chcon system_u:object_r:admin_home_t:s0 /root/vagrant-box-build-time

# Delete and lock root password
passwd --delete root
passwd --lock root
