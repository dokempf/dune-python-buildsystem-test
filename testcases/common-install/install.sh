#!/bin/bash

set -e

#
# The minimal global installation test case: Building and installing dune-common solely
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/common-install --opts=./testcases/common-install/config.opts --module=dune-common"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Installing and removing the build tree
sudo ./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install
rm -rf build

# Testing that the installed Python package works
python -c "import dune.common"
