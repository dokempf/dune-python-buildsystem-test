# Implemented Strategy

# Interface Changes

* The CMake function `dune_python_install_package` is affected in several ways
  * A `DEPENDS` parameter is added with CMake targets that this Python package
    depends on.
  * A `CMAKE_METADATA_FILE` is added: A filename that CMake should export some
    meta data about this build to. The file will be installed together with the
    Python package. This mechanism is used by the Python bindings to transport
    information from CMake to the installed Python package. A module dune-mymodule
    that provides a Pythob package dune.mymodule should set this to dune/mymodule/metadata.cmake
* The CMake input variable `DUNE_PYTHON_INSTALL_EDITABLE` is non-functional and
  deprecated: Installations into the Dune-internal virtualenv are always editable.
  If you want to enable editable installation into your system environment (e.g.
  because it is a virtual environment), you can always do so with `-DDUNE_PYTHON_ADDITIONAL_PIP_PARAMS=--editable`
* The CMake input variable `DUNE_PYTHON_VIRTUALENV_SETUP` is non-functional and
  deprecate as its behaviour is enabled by default.
* The function `dune_python_require_virtualenv_setup` is non-functional and deprecated
  for the same reason.
* The `INTERPRETER` argument of `dune_python_add_test` has been removed. It has
  only existed for a few weeks, so there is no deprecation period.

# Changes 

