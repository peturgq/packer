## Windows Packer Templates

* Virtio drivers are loaded on startup
* Configured as 2 CPU and 4 GB memory by default
* No updates or services packs applied
* Firewall is disabled
* RDP enabled
* Powershell is installed with Remote Execution policy is set to unrestricted

The OS can be evaluated for 180-days. http://technet.microsoft.com/en-US/evalcenter/dn205286.aspx

## Packer Powershell Dependency

You need to install the Powershell provisioner for packer:

https://github.com/packer-community/packer-windows-plugins

### Quick Start

```bash
$ packer build windows-2012-R2-standard-amd64.json
```

### Windows 2012 R2 Standard

* User Administrator
* Default password Password123
* This template has the Cloud Instance Manager, but it does not work
  without a reboot (yet).

Alter the admin password and the disk size:

```
$ read -p 'Enter password: ' -s password
$ packer build -var "disk_size=61440" -var "password=$password" windows-2012-R2-standard-amd64.json
```

You also need to update the Autounattend.xml file with the new
password.

*NOTE*: Password strength requirements are pretty harsh
http://technet.microsoft.com/en-us/library/cc786468%28v=ws.10%29.aspx
