Packer Templates
================

*note:*

*GreenQloud provides no official support for this community repository*

GreenQloud's Packer Templates is a project that encapsulates [Packer](http://packer.io) templates for building virtual machine images for CloudStack. There are also templates for creating [Vagrant](http://vagrantup.com) baseboxes, which are used for testing Single Node Developer Setups.

# Useful commands

Packer validate: `packer validate template.json`

Packer debug and logging: `. debug.rc` (in project's main directory)

Packer build template: `packer build template.json` (make is often a better option)

Packer build with specified builder: `packer build -only=vmware-iso template.json`

# CloudStack

The virtual machine images built for CloudStack are currently made for two types of hypervisors; QEMU/KVM and VMWare.

## Templates

The CloudStack templates are located under `cloudstack`. The linux templates all have their JSON files in this directory.

The Windows 2012 R2 template is located in a self contained directory `cloudstack/windows`.

### Windows 2012 R2

Builders: QEMU

See readme in `cloudstack/windows`.

### Windows 2008 r2 Datacenter

Builders: QEMU, VMware

VMware: `make windows-2008-r2-vmware`

QEMU: `make windows-2008-r2-qemu` Not implemented yet.

### CentOS 6.5

Builders: QEMU, VMware

QEMU: `make centos-6.5-qemu`

VMware: `make centos-6.5-vmware`

# Vagrant

Current developer baseboxes include chef, and depending on the version an upgraded
kernel, dependencies already installed.

### Raw Baseboxes

Baseboxes that come with chef.

gqdev_centos-6.5_chef_latest.box

### Raw Baseboxes with upgraded kernel

Baseboxes used for testing chef recipies come with Linux kernel 3.10.

gqdev_centos-6.5_kernel-3.10.box

### Basebox with dependencies.

Baseboxes used for testing CloudStack.

gqdev_centos-6.5_cs-base.box

### Basebox with dependencies and CloudStack already setup. (Future Option)

Basically a CloudStack installation in a box, combined with upgrade scripts this could be used to get a development environment setup with little effort.

gqdev_centos-6.5_cs-full.box

## Build Your Own Boxes

First, install [Packer](http://packer.io) and then clone this project.

Inside the `packer` directory, a JSON file describes each box that can be built. You can use `packer build` to build the
boxes.

    $ packer build centos-6.5-x86_64.json

If you want to use a another mirror site, use mirror variable.

    $ packer build -var 'mirror=http://fedora.is/CentOS' debian-7.2.0-i386.json


# License & Authors

- Author: Jon Thor Kristinsson (<jon@greenqloud.com>)
- Author: Jordi Amorós (<jordi@greenqloud.com>)

```text
Copyright 2014, Greenqloud (<support@greenqloud.com>)
```
