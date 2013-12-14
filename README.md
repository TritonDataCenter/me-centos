# me-centos

This repo allows one to create the package required by
[mi-centos](https://www.github.com/joyent/mi-centos) which includes all
necessary files to run on SmartOS and the Joyent Public Cloud.

## Using

Once this package is built, it needs to be in the RPMs directory for
[mi-centos](https://www.github.com/joyent/mi-centos) to be included in
the custom kickstart ISO.

## Upgrading guest tools in VMs based on CentOS images <2.5.1

This repo also builds a shar installer for upgrading guest tools
in a CentOS VM. To build the shar:

    make clean shar

It can be published to where the Joyent image creation docs point
with:

    make publish   # need access to download.joyent.com

This will publish to <https://download.joyent.com/pub/guest-tools/>.

Inside a CentOS VM the typical install procedure is:

    curl https://download.joyent.com/pub/guest-tools/centos-guest-tools-for-smartos-2.5.1.sh | sh
