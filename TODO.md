Test cases to potentially add

* pip --user installation
* dune-testtools workflow
* dune-codegen workflow
* editable use case
* Non-standard compiler use case
* Degrade shared libs to a separate test case

Interfaces to revisit/deprecate/remove:

* Is the complex default behaviour of `DUNE_PYTHON_INSTALL_LOCATION` still adequate?
* `dune_python_require_virtualenv_setup` -> deprecated
* `DUNE_PYTHON_VIRTUALENV_SETUP` -> deprecated
* `DUNE_PYTHON_ALLOW_GETPIP` -> remove behaviour and deprecate variable
* The `PUREPYTHON` argument of `dune_python_install_package` was introduced to distinguish use cases that are now unified - correct?
* Is the `INTERPRETER` argument of `dune_python_add_test` still needed or should all tests use the virtual env?
* `DUNE_PYTHON_INSTALL_EDITABLE` -> yes in env, no in sys, otherwise through `DUNE_PYTHON_ADDITIONAL_PIP_PARAMS`
* `add_python_targets`: Is the symlinking necessary? The name is for sure bad.

Missing features that I have encountered but postponed:

* No Python -> Skip over most of `DunePythonCommonMacros.cmake`

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
