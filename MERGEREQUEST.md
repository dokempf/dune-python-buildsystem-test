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

# Changes 

