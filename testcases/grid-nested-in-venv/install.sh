#!/bin/bash

set -e

#
# Test case with the system interpreter being a virtual environment
# created by venv.
#

python -m venv env
source env/bin/activate

DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-nested-in-venv --opts=./testcases/grid-nested-in-venv/config.opts --module=dune-grid"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Testing the Python code

## FIXME: The following line is currently necessary, but should vanish
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install_python

./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_python

# Installing
sudo ./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install
rm -rf build
python -c "import dune.grid"
