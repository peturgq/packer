Packer Templates
================

*note:*

*GreenQloud provides no official support for this community repository*

GreenQloud's Packer Templates is a project that encapsulates [Packer](http://packer.io) templates for building virtual machine images for QStack. 


# Requirements

You need

* qemu
* packer

We have tested only on Debian 7, but you should get the same results anywhere if using latest stables of qemu and packer


# Stable templates

go the the `stable` directory and issue `make`.  You will get a list of templates available and you can build them by issuing `make <templatename>-version_minorversion`

The finished template will be placed in a new directory called `output-<templatename>-version_minorversion`

### disk size

You can control the disk size of the produced template by setting the `disk_size` parameter, for example: `make debian-8_1 disk_size=61440` (this would produce a 60GB template)

# "testing" templates

These templates work the same way as the ones in the *stable* directory, although they have not been polished.


# License & Authors

- Author: Jon Thor Kristinsson (<jon@greenqloud.com>)
- Author: Jordi Amorós (<jordi@greenqloud.com>)
- Author: Kristinn Soffanías Rúnarsson (<soffi@greenqloud.com>)


```text
Copyright 2015, Greenqloud (<support@greenqloud.com>)
```
