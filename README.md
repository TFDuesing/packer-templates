packer-templates
================

This is a collection of Packer templates, kickstart files, and shell scripts
that can be used to build VirtualBox-backed Vagrant boxes from canonical Linux
distribution ISOs.


Prerequisites
-------------

* [Packer](http://www.packer.io/)
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://www.vagrantup.com)


Usage
-----

	$ git clone https://github.com/TFDuesing/packer-templates.git
	$ cd packer-templates/<desired template directory>
	$ packer build template.json

Once the build is complete, Packer will output a Vagrant .box file in the
current working directory.  You can add this box to your Vagrant installation
with `vagrant box add <name> </path/to/.box file>`.


Helpful Documentation
---------------------

* [`packer build`](http://www.packer.io/docs/command-line/build.html)
* [`vagrant box`](http://docs.vagrantup.com/v2/boxes.html)
