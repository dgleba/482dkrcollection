#!/usr/bin/env bash
# https://github.com/panubo/docker-postfix

set -e
[ "${DEBUG:-false}" == 'true' ] && set -x


echo "Running command $*"
exec "$@"
