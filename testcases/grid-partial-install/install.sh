#!/bin/bash

set -e

#
# Minimal installation test case with module dependencies: Building and installing dune-grid
#

# Installing and wiping dune-common
DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-partial-install --opts=./testcases/grid-partial-install/config.opts --module=dune-common"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all
sudo ./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install
rm -rf build
rm -rf dune-common

# Building dune-grid
DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-partial-install --opts=./testcases/grid-partial-install/config.opts --module=dune-grid"
dunecontrol $DUNECONTROL_OPTS all

# Testing dune-grid
dunecontrol $DUNECONTROL_OPTS make test_python
