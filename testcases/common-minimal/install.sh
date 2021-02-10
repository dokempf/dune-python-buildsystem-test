#!/bin/bash

#
# The minimal test case: Only building dune-common
#

./dune-common/bin/dunecontrol --builddir=$(pwd)/build/common-minimal --opts=./testcases/common-minimal/config.opts --module=dune-common all
