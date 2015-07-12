## Time on medium specced server

time to build with packer: ~25mins
time to upload to s3 on 1gbit: ~7mins
download template to QS and register: ~5mins
boot first instance and test: ~5mins

## Windows Packer Templates

* Virtio drivers are loaded on startup
* Configured as 2 CPU and 4 GB memory by default
* No updates or services packs applied
* Firewall is disabled
* RDP enabled
* Powershell is installed with Remote Execution policy is set to unrestricted

The OS can be evaluated for 180-days. http://technet.microsoft.com/en-US/evalcenter/dn205286.aspx

### Quick Start

```bash
$ packer build windows-2012-R2-standard-amd64.json
```

### Windows 2012 R2 Standard

* User Administrator
* Default password Administr@tor

Alter the admin password and the disk size:

```
$ read -p 'Enter password: ' -s password
$ packer build -var "disk_size=61440" -var "password=$password" windows-2012-R2-standard-amd64.json
```

