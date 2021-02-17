#!/bin/bash

set -e

#
# The minimal global installation test case: Building and installing dune-common solely
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/common-embed --opts=./testcases/common-embed/config.opts --module=dune-common"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Build C++ tests related with Python (build_tests would be too expensive here)
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_embed1
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_embed2

./dune-common/bin/dunecontrol $DUNE_CONTROL_OPTS bexec ctest -R embed

# Installing and removing the build tree
sudo ./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install
rm -rf builds

# Testing that the installed embedded Python application works
test_embed2
