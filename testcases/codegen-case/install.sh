#!/bin/bash

set -e

#
# Testing a dune-codegen workflow
#

pushd dune-codegen
./patches/apply_patches.sh
popd

DUNECONTROL_OPTS="--builddir=$(pwd)/build/codegen-case --module=dune-codegen"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

pushd build/codegen-case/dune-codegen
make poisson_neumann
pushd test/poisson
./poisson_neumann poisson_neumann.ini
