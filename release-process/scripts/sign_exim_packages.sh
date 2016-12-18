#!/bin/sh
#
# gpg signs all *.tar.* files under a given directory
# key used set from env var EXIM_KEY, script defaults that to Nigel's.
# woe betide the poor sod who does not use a gpg agent, so has
# to enter their password for every file...
#

dir=${1:?start directory}

: ${EXIM_KEY:=nigel@exim.org}

find "$dir" \
    -type f -name '*.tar.*' \
    -exec gpg  --local-user ${EXIM_KEY} --detach-sig --armor {} \;
