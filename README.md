This repository is used for test-driven development of a build system overhaul for the Dune framework.
An outline and discussion can be found here: https://gitlab.dune-project.org/core/dune-common/-/issues/247

The `testcases` subdirectory contains scenarios that the changes should be able to handle:

* `common-build`: A minimal build of dune-common - merely a marker that something fails fundamentally
* `grid-build`: A build of dune-grid - simplest test that relies on module inter-dependencies
* `grid-nested-in-venv`: A simple test where the system Python interpreter is actually a `venv`-created virtual environment
* `grid-nested-in-virtualenv`: A simple test where the system Python interpreter is actually a `virtualenv`-created virtual environment
* 