cmake_snippets
##############

..
  ----------------------------------------------------------------------------|

Some CMake code snippets to play around and try out some features.

How to run
==========

To run all examples the cmake workflow feature can be used.

.. code-block:: shell

  cmake --workflow --preset=default

To run a specific examples follwing workflow can be used:

.. code-block:: shell

  cmake --preset=default
  ctest --preset=default -R <example name>

Also all examples are standalone and can be built using the default CMake workflow.

.. code-block:: shell

  cd verify_header_example
  cmake -S . -B ./build
  cmake --build ./build
