# me-centos changelog

## 2.5.1 (not yet released)

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

## 2.5.0

Change log started for this version.

