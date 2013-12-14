#!/bin/bash
#
# Copyright (c) 2013, Joyent, Inc. All rights reserved.
#
# Upgrade CentOS guest tools. This is being run in the unshar'd
# tmp dir on the CentOS guest.
#

if [[ -n "$TRACE" ]]; then
    export PS4='[\D{%FT%TZ}] ${BASH_SOURCE}:${LINENO}: ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
    set -o xtrace
fi
set -o errexit
set -o pipefail


TOP=$(cd $(dirname $0)/ >/dev/null; pwd)


#---- support stuff

function fatal
{
    echo "$0: fatal error: $*"
    exit 1
}

function errexit
{
    [[ $1 -ne 0 ]] || exit 0
    fatal "error exit status $1"
}


#---- mainline

trap 'errexit $?' EXIT

DISTRO=$(grep -w '^Image' /etc/product 2>/dev/null | awk '{print $2}')
if [[ "$DISTRO" != "centos" ]]; then
    fatal "can only run on a CentOS guest VM"
fi

# Sanity check
[[ ! -f ./usr/sbin/mdata-put ]] \
    && fatal "cwd, $(pwd), does not look like a guest tools build"

updated=
for file in $(find etc lib usr -type f); do
    src=./$file
    dst=/$file
    if [[ ! -f $dst || -n "$(diff $dst $src || true)" ]]; then
        echo "update '$dst'"
        dstdir=$(dirname $dst)
        [[ ! -d $dstdir ]] && mkdir -p $dstdir
        cp -P $src $dst
        updated="$updated $dst"
    fi
done
if [[ ! -L /lib/smartdc/mdata-get ]]; then
    rm -f /lib/smartdc/mdata-get
    ln -s /usr/sbin/mdata-get /lib/smartdc/mdata-get
    updated="$updated /lib/smartdc/mdata-get"
fi
if [[ -z "$updated" ]]; then
    echo "Up-to-date. No guest tools files were updated."
fi

