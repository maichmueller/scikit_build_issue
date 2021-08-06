cmake_minimum_required(VERSION 3.15)

project(testpkg VERSION 0.1 LANGUAGES CXX)

set(PYBIND11_FINDPYTHON TRUE)
message("PYBIND11 DIRECTORY: ${pybind11_SEARCH_PATH}")
find_package(pybind11 CONFIG PATHS ${pybind11_SEARCH_PATH} REQUIRED)

pybind11_add_module(_core src/pkg/module.cpp)

set_target_properties(_core PROPERTIES
        CXX_STANDARD 17
        CXX_VISIBILITY_PRESET hidden
        )
target_include_directories(_core
        PRIVATE
        ${Python_INCLUDE_DIRS}
        ${CONAN_INCLUDE_DIRS_PYBIND11}
        )
target_link_libraries(_core PUBLIC ${PYTHON_LIBRARIES})


install(TARGETS _core LIBRARY DESTINATION .)



