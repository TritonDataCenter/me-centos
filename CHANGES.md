# me-centos changelog

## 2.6.0 (not yet released)

- Includes [mdata-client sha
  e50077c](https://github.com/joyent/mdata-client/commit/e50077c) builds.

- IMGAPI-370 Move mdata-* tools to "/usr/sbin". For bwcompat there is a
  "/lib/smartdc/mdata-get" symlink.

- `make shar` to build a shar for upgrading the guest tools in one's
  CentOS VM. Builds of these will be provided on
  <https://download.joyent.com/pub/guest-tools>.

- IMAGE-370 Update guest tools (/lib/smartdc/...) for image management.
  New the 'mdata-*' tools, adding mdata-list, mdata-put and mdata-delete.
  Also adds support for an 'operator-script' run at boot time.

- Removed /opt/local/smartdc. This was for Joyent Public Cloud use only, 
  but is no longer required. This should not affect users of the image 
  since /opt/local would not be in their PATH. Instuctions for installing
  the CLoudAPI CLI can be found here: 
  http://apidocs.joyent.com/cloudapi/#getting-started

- Made scripts in /lib/smartdc executable (chmod 755)

- Updated CentOS version in lib/smartdc/product to 6.5. 6.4 is deprecated

- Added fix for IMAGE-441: "No /etc/hostid generated on linux images".
  A unique hostid is generated at boot if hostid returns 00000000. 

## 07/xx/2013 - 2.5.0
- Going back to basics
    - Stock Centos 6.4 distro and Kernel
- Added Duo Security (disabled by default)

## xx/xx/xxxx - 2.4.3 ( datasets update )
- Updated /lib/smartdc/run-user-script
    - Moved where user-script and lock file are stored
- Updated /lib/smartdc/format-secondary-disk
    - Changed partition type to gpt to allow for disk partions > 2TB

## 05/09/2013 - 2.4.2 ( dataset update )
- Updated /lib/smartdc/prepare-image
    - Added check to make sure that /etc/fstab is not mounting disk via UUID's
    - Updated to set permissions for /tmp and /var/tmp 1777
    - Updated how /etc/hostname is created
- Updated /lib/smartdc/joyent_product
    - Systems are no longer SmartMachines, but now Instances
- Updated /lib/smartdc/joyent_motd_footer
    - Updated with minor formatting of version info

## 04/17/2013 - 2.4.1 ( ISO image install )
- Update /lib/smartdc/format-secondary-disk
    - Added logging for cration of /data
- Updated /lib/smartdc/prepare-image
    - Removed zero filling of disk and added copying of root disk to a new partition
    - Scripts are now distro specific and added checking to ensure that the script only runs on the distor it is authored for
    - Updated MOTD with minor logo changes
    - Added checks for JPC SmartDC Node.JS utility installed in /opt/local/smartdc
    - Added check to make sure that /etc/fstab is not mounting disk via UUID's
- Enabled Dynamic MOTD to display dataset information
- Added the ability for customers to overwrite /root/.ssh/authorized_keys by adding this metadata variable:
    - overwrite_root_akeys = OVERWRITE
- Added many QA and security checks
- Updated script to use libs and vars from lib_smartdc_scripts.cfg
- Updated /etc/ntp.conf file to listen to IPv4 interfaces
- Added /lib/smartdc/README
- Added /opt/local/smartdc directory
    - This is a static install of Node.JS that is exclusively used to provides Joyent Cloud API access
    - Node.JS 0.10.3 is installed with version 6.5.7
- Updated /lib/smartdc/joyent_product_info
    - Added new URL for CentOS docs
- Updated kernel to 3.8.7
    - Added PPP and QoS 
- Updated /lib/smartdc/joyent_rc.local
    - Removed non-CentOs specific subs this makes this version only specific to Debian datasets
- Updated /lib/smartdc/joyent_motd_footer
    - Minor spacing changes for MOTD banner
    - Changed default that MOTD System Checks and MOTD Alerts/Info/Tips from Joyent are disabled
    - MOTD System Checks can be turned on by setting MDATA tag enable_motd_sys_info = TRUE
     or setting $ENABLE_MOTD_JOYENT_INFO = TRUE in /lib/smartdc/joyent_motd_footer
    - MOTD Alerts/Info/Tips from Joyent can be turned on by setting MDATA tag enable_motd_joyent_info = TRUE
     or setting $ENABLE_MOTD_JOYENT_INFO = TRUE in /lib/smartdc/joyent_motd_footer
    - Updated Joyent MOTD header
    - Updated how free memory is calculated to include disk buffers and cached
- Added /sbin/dhclient-script.joyent
    - This is a reference file for when DHCP client is updated so that hostname setting can be reset
- Updated all distro packages via yum update
- Removed all lsb calls in /lib/smartdc scripts
- Removed all Joyent specific code and now call /lib/smartdc/joyent_rc.local
- Added /lib/smartdc/set-hostname
    - Script that is called by the dhcp client via /sbin/dhclient-script
    - Host name is set in 3 ways in this order:
        1. /etc/hostname is used if exists and is not empty
        2. Metadata value 'hostname' is used if set
        3. Hostname sent from DHCP server is used
- Added /lib/smartdc/joyent_rc.local
    - All Joyent specific calls from /etc/rc.local are now here
- Added /lib/smartdc/joyent_linux_repo_gpg_key
    - This is the public GPG key Joyent uses to validate to the Joyent Linux Repo at linux.joyent.com
    - NOTE: at this time the CentOS repo is not GPG signed
- Added symbolic links for /etc/product, /etc/joyent_dataset_changelog and /etc/joyent_version
    - Their target files now reside in /lib/smartdc to locate Joyent specific files in one place as much as possible.
- Added /lib/smartdc/redhat-powerbtn-acpi-support.sh
    - This is called by the acpi event when API calls reboot via /etc/acpi/events/powerbtn-acpi-support the Joyent specific script will log to /var/log/mesages when an API reboot or shutdown is called
    - Note that reset from the API will not be logged as the KVM is reset immediatly
- Added /lib/smartdc/lib_smartdc_scripts.cfg
    - This is a central script that holds common variables and functions used in /lib/smartdc all scripts in /lib/smartdc now use this config file for common libs and variables
