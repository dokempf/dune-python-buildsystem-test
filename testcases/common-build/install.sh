#!/bin/bash

set -e

#
# The minimal test case: Only building dune-common with the default build directory
#

DUNECONTROL_OPTS="--opts=./testcases/common-build/config.opts --module=dune-common"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Testing the Python code
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_python
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS bexec ctest -R embed
