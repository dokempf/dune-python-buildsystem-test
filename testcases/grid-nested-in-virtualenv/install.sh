#!/bin/bash

set -e

#
# Test case with the system interpreter being a virtual environment
# created by virtualenv.
#

python -m pip install virtualenv
python -m virtualenv env
source env/bin/activate

DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-nested-in-virtualenv --opts=./testcases/grid-nested-in-virtualenv/config.opts --module=dune-grid"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Testing the Python code

## FIXME: The following line is currently necessary, but should vanish
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install_python

./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_python

# Installing
sudo ./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install
rm -rf build
python -c "import dune.grid"
