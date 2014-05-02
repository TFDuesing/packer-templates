packer-templates
================

This is a collection of Packer templates, kickstart files, and shell scripts that can be used to build Vagrant boxes for VirtualBox and VMware providers, starting from canonical Linux distribution ISOs.


Prerequisites
-------------

* [Packer](http://www.packer.io/)
* [VirtualBox](https://www.virtualbox.org) and/or [VMWare Fusion](http://www.vmware.com/products/fusion)
* [Vagrant](http://www.vagrantup.com)


Usage
-----

	$ git clone https://github.com/TFDuesing/packer-templates.git
	$ cd packer-templates/<desired template directory>
	$ packer build template.json

Once the build is complete, Packer will output one or more Vagrant .box files in the current working directory.  You can add a box to your Vagrant installation with `vagrant box add --name <name-of-box> </path/to/.box file>`.


Helpful Documentation
---------------------

* [`packer build`](http://www.packer.io/docs/command-line/build.html)
* [`vagrant box`](http://docs.vagrantup.com/v2/boxes.html)
