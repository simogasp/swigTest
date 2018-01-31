if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} GREATER 3.6)
    find_package(Matlab REQUIRED COMPONENTS MAT_LIBRARY MX_LIBRARY)
else()
    find_package(Matlab REQUIRED)
endif()

include_directories(${Matlab_INCLUDE_DIRS})

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

message("Matlab_MAT_LIBRARY ${Matlab_MAT_LIBRARY}")
message("Matlab_MX_LIBRARY ${Matlab_MX_LIBRARY}")

set_source_files_properties(library.i PROPERTIES CPLUSPLUS ON)
set_source_files_properties(library.i PROPERTIES SWIG_FLAGS "-includeall")
if(${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION} GREATER 3.7)
    swig_add_library(matlabLib LANGUAGE matlab SOURCES library.i )
else()
    swig_add_module(matlabLib  matlab  library.i )
endif()
swig_link_libraries(matlabLib swigTest ${Matlab_LIBRARIES} ${Matlab_MEX_LIBRARY} ${Matlab_MAT_LIBRARY} ${Matlab_MX_LIBRARY})