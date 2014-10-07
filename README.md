Vagrant box LAMP ready with OCI8 support, Instantclient and aliased vhosts
==========================================================================

Inspired to: https://github.com/afhole/vagrant-lamp.git

Vagrantfile and Chef recipes for LAMP (Ubuntu Precise64) development environment.

Requirements
============
- Git
- VirtualBox
- Vagrant
- NFS:

  Shared folders are configured with NFS for easy permissions management and performance reasons.
  This seems to 'just work' on Mac OS X 10.8 Mountain Lion, on Debian/Ubuntu run `sudo apt-get install nfs-kernel-server`

Usage
=====
1. Clone
2. Check Vagrantfile defaults (Guest VM IP address)
3. Run `vagrant up` inside project folder

```
$ git clone git@github.com:toretto460/vagrant-lamp-oci8.git
$ cd vagrant-lamp-oci8 
$ vagrant up
```

New vhosts will be created automatically by adding folders to 'vhosts'. The folder name should match the DNS name. 
Document root is 'www' inside each vhost. Add vhosts names to your hosts file, or setup dnsmasq with a wildcard, e.g. *.vm

Example
=======

```
vhosts/
	dev.symfony.com/
		www/
			{your application code}
	dev.silex.com/
		www/
			{your application code}
```