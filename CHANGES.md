# me-centos changelog

## 2.5.1 (not yet released)

- IMGAPI-370 Move mdata-* tools to "/usr/sbin". For bwcompat there is a
  "/lib/smartdc/mdata-get" symlink.

- `make shar` to build a shar for upgrading the guest tools in one's
  CentOS VM. Builds of these will be provided on
  <https://download.joyent.com/pub/guest-tools>.

- IMAGE-370 Update guest tools (/lib/smartdc/...) for image management.
  New the 'mdata-*' tools, adding mdata-list, mdata-put and mdata-delete.
  Also adds support for an 'operator-script' run at boot time.

## 2.5.0

Change log started for this version.

