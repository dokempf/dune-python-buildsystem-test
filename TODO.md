Test cases to potentially add

* pip --user installation
* dune-testtools workflow
* dune-codegen workflow
* Non-standard compiler use case

Interfaces to revisit/deprecate/remove:

* Is the complex default behaviour of `DUNE_PYTHON_INSTALL_LOCATION` still adequate?
* `DUNE_PYTHON_ALLOW_GETPIP` -> remove behaviour and deprecate variable
* `add_python_targets`: Is the symlinking necessary? The name is for sure bad.

Missing features that I have encountered but postponed:

* No Python -> Skip over most of `DunePythonCommonMacros.cmake`
* My way of setting up dune-py is not filtering stdout so far, but these polishments should happen after consulting Andreas about this way of doing it.
* The `assertHave` calls in `dune/grid/_grids.py` generate a circular dependency: They require an already configured dune-py, but I need to do `import dune.grid` during its setup

Documentation issues:

* `DUNE_PYTHON_VIRTUALENV_PATH` can be set from the outside to skip the generation process

Simplifications:

* We require Python 3, so we always have `venv`

Interesting Stuff:

* The interplay of embedded interpreter and virtualenv is a rabbit hole:
  * https://bugs.python.org/issue22213
  * https://bugs.python.org/issue35706

Errors that could or should be asserted:

* If the System interpreter and the virtual env interpreter in `DUNE_PYTHON_VIRTUALENV_PATH` are incompatible, we might run into serious trouble with embedded Python.
