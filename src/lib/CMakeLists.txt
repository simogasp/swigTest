add_library(swigTest SHARED library.cpp library.hpp)


####
# Installation

# Layout. This works for all platforms:
#   * <prefix>/lib/cmake/<PROJECT-NAME>
#   * <prefix>/lib/
#   * <prefix>/include/
set(config_install_dir "lib/cmake/${PROJECT_NAME}")
set(include_install_dir "include")

set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")

# Configuration
set(version_config "${generated_dir}/${PROJECT_NAME}ConfigVersion.cmake")
set(project_config "${generated_dir}/${PROJECT_NAME}Config.cmake")
set(targets_export_name "${PROJECT_NAME}Targets")
set(namespace "${PROJECT_NAME}::")

# Include module with fuction 'write_basic_package_version_file'
include(CMakePackageConfigHelpers)

# Configure '<PROJECT-NAME>ConfigVersion.cmake'
# Note: PROJECT_VERSION is used as a VERSION
write_basic_package_version_file(
        "${version_config}" COMPATIBILITY SameMajorVersion
)

# Configure '<PROJECT-NAME>Config.cmake'
# Use variables:
#   * targets_export_name
#   * PROJECT_NAME
configure_package_config_file(
        "${PROJECT_SOURCE_DIR}/cmake/Config.cmake.in"
        "${project_config}"
        INSTALL_DESTINATION "${config_install_dir}"
)

# Targets:
install(
        TARGETS swigTest
        EXPORT "${targets_export_name}"
        LIBRARY DESTINATION "lib"
        ARCHIVE DESTINATION "lib"
        RUNTIME DESTINATION "bin"
        INCLUDES DESTINATION "${include_install_dir}"
)

# Headers:
install(
        DIRECTORY "${PROJECT_SOURCE_DIR}/src/lib/"
        DESTINATION "${include_install_dir}/swigTest"
        FILES_MATCHING PATTERN "*.hpp"
)


# Config
#   * <prefix>/lib/cmake/swigTest/swigTestConfig.cmake
#   * <prefix>/lib/cmake/swigTest/swigTestConfigVersion.cmake
install(
        FILES "${project_config}" "${version_config}"
        DESTINATION "${config_install_dir}"
)

# Config
#   * <prefix>/lib/cmake/swigTest/swigTestTargets.cmake
install(
        EXPORT "${targets_export_name}"
        NAMESPACE "${namespace}"
        DESTINATION "${config_install_dir}"
)