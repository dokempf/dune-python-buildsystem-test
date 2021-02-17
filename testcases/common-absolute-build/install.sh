#!/bin/bash

set -e

#
# Building only building dune-common into a build directory that is not nested under the source
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/common-build --opts=./testcases/common-build/config.opts --module=dune-common"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Testing the Python code
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_python
