cmake_minimum_required(VERSION 3.3)
project(swigTest VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 11)

option(BUILD_MATLAB_WRAPPER "Build the matlab wrapper with SWIG" ON)
option(BUILD_PYTHON_WRAPPER "Build the python wrapper with SWIG" ON)

if(${BUILD_MATLAB_WRAPPER} OR ${BUILD_PYTHON_WRAPPER})
    find_package(SWIG REQUIRED)
    include(${SWIG_USE_FILE})
endif()

add_subdirectory(src)