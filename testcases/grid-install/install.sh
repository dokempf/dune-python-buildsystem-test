#!/bin/bash

set -e

#
# Minimal installation test case with module dependencies: Building and installing dune-grid
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-install --opts=./testcases/grid-install/config.opts --module=dune-grid"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Installing and removing the build tree
sudo ./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install
rm -rf build

# Testing the globally installed Python package
python -c "import dune.grid"
