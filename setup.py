from __future__ import print_function

import sys

try:
    from skbuild import setup
except ImportError:
    print(
        "Please update pip, you need pip 10 or greater,\n"
        " or you need to install the PEP 518 requirements in pyproject.toml yourself",
        file=sys.stderr,
    )
    raise


from setuptools import find_packages


try:
    import pybind11
    import os
    pybind11_path = os.path.join(os.path.dirname(pybind11.get_include()), "share", "cmake")
except ImportError as e:
    raise e


setup(
    version="0.0.1",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    cmake_install_dir="src/pkg",
    cmake_args=[f"-Dpybind11_SEARCH_PATH={pybind11_path}"]
)

# from setuptools import setup
# setup(
#     version="0.0.1",
#     packages=find_packages(where="src"),
#     package_dir={"": "src"},
# )
