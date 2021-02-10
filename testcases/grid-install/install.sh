#!/bin/bash

set -e

#
# Minimal test case with module dependencies: Building dune-grid
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-build --opts=./testcases/grid-build/config.opts --module=dune-grid"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install

# Testing the globally install
rm -rf build
python -c "import dune.grid"
