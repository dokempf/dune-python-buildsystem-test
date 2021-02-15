#!/bin/bash

set -e

#
# Building only building dune-common into a build directory that is not nested under the source
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/common-build --opts=./testcases/common-build/config.opts --module=dune-common"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Build C++ tests related with Python (build_tests would be too expensive here)
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_embed1
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_embed2

# Testing the Python code
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_python
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS bexec ctest -R embed
