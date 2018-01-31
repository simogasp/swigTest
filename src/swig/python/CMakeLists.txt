find_package(PythonLibs REQUIRED)
include_directories(${PYTHON_INCLUDE_PATH})

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

set(CMAKE_SWIG_FLAGS "")

set_source_files_properties(library.i PROPERTIES CPLUSPLUS ON)
set_source_files_properties(library.i PROPERTIES SWIG_FLAGS "-includeall")
if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} GREATER 3.7)
    swig_add_library(pythonLib LANGUAGE python SOURCES library.i )
else()
    swig_add_module(pythonLib  python  library.i )
endif()
swig_link_libraries(pythonLib swigTest ${PYTHON_LIBRARIES})