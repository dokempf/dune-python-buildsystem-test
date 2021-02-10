#!/bin/bash

set -e

#
# Minimal test case with module dependencies: Building dune-grid
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-build --opts=./testcases/grid-build/config.opts --module=dune-grid"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Testing the Python code

## FIXME: The following line is currently necessary, but should vanish
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install_python

./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_python
