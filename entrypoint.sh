#!/bin/sh

set -eu

export GITHUB="true"

sh -c "/usr/local/bin/entrypoint.sh $*"