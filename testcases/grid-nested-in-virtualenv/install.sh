#!/bin/bash

set -e

#
# Test case with the system interpreter being a virtual environment
# created by virtualenv.
#

python3 -m pip install virtualenv
python3 -m virtualenv env
source env/bin/activate

DUNECONTROL_OPTS="--builddir=$(pwd)/build/grid-nested-in-virtualenv --opts=./testcases/grid-nested-in-virtualenv/config.opts --module=dune-grid"
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS all

# Testing the Python code
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make test_python

# Installing the Python code into the environment
./dune-common/bin/dunecontrol $DUNECONTROL_OPTS make install_python
python -c "import dune.grid"
