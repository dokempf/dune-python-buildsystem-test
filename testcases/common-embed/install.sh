#!/bin/bash

set -e

#
# The minimal global installation test case: Building and installing dune-common solely
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/common-embed --opts=./testcases/common-embed/config.opts --module=dune-common"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Build C++ tests related with embedded Python
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_embed1
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_embed2

pushd build/common-embed/dune-common/dune/python/test
./test_embed1
./test_embed2

# Here, we should also test installing and running the installed executable
# I have done this, but I do not want to commit installing a test in Dune common.
# Might add a dune-fufem case to cover that.
