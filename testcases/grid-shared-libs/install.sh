#!/bin/bash

set -e

#
# Minimal test case with module dependencies: Building dune-grid
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-shared-libs --opts=./testcases/grid-shared-libs/config.opts --module=dune-grid"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Testing the Python code
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_python

# Installing and removing the build tree
sudo ./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install
rm -rf build

# Testing the globally installed Python package
python -c "import dune.grid"
