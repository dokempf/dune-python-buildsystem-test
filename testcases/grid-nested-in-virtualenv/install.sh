#!/bin/bash

set -e

#
# Test case with the system interpreter being a virtual environment
# created by virtualenv.
#

python -m virtualenv env
source env/bin/activate

DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-nested-in-virtualenv --opts=./testcases/grid-nested-in-virtualenv/config.opts --module=dune-grid"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all
