Fedora-19-OpenStack
===================

This is an extremely basic Packer template which defines a Fedora 19-based image in Rackspace Cloud Servers.

This is clearly not a VirtualBox-backed Vagrant box built from a canonical Linux distribution ISO, but since it’s more of a proof-of-concept than anything else, I didn’t feel like calling it out in the main README.

The one prerequisite is a set of three environmental variables required by [Gophercloud][1], which is the Go SDK used by [Packer’s OpenStack builder][2].  By way of example, I added this block to my Bash profile:

	export SDK_PROVIDER=rackspace-us
	export SDK_USERNAME=tfduesing
	export SDK_PASSWORD=password

[1]: https://github.com/rackspace/gophercloud
[2]: http://www.packer.io/docs/builders/openstack.html
