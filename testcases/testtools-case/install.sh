#!/bin/bash

set -e

#
# Testing a dune-testtools workflow
#

DUNECONTROL_OPTS="--builddir=$(pwd)/build/testtools-case --module=dune-testtools"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

pushd build/testtools-case/dune-testtools
make build_tests
ctest
