#!/bin/bash

set -e

#
# The minimal test case: Only building dune-common with the default build directory
#

DUNECONTROL_OPTS="--opts=./testcases/common-build/config.opts --module=dune-common"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all
#./dune-common/build-cmake/run-in-dune-env ./dune-common/bin/setup-dunepy.py $DUNECONTROL_OPTS

# Build C++ tests related with Python (build_tests would be too expensive here)
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_embed1
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_embed2

# Testing the Python code
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_python
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS bexec ctest -R embed
