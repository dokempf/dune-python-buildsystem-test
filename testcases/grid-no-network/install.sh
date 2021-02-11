#!/bin/bash

set -e

#
# Make sure that no network connection will disable Python bindings
#

# Go into an env to prevent the system Python having all packages
python -m venv env
source env/bin/activate

# Building should be successful despite the missing PyPI
DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-no-network --opts=./testcases/grid-no-network/config.opts --module=dune-grid"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all
