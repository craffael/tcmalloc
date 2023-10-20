# We require 3.21 because of https://cmake.org/cmake/help/v3.22/command/target_link_libraries.html#linking-object-libraries-via-target-objects
cmake_minimum_required( VERSION 3.21)

include("cmake/HunterGate.cmake")

HunterGate(
    URL "https://github.com/cpp-pm/hunter/archive/v0.25.0.tar.gz"
    SHA1 "a1296b351dbfaf036c92d85c1bdb461f615849fa"
    LOCAL
)

project(tcmalloc LANGUAGES CXX ASM)


include(GNUInstallDirs)
include("cmake/tcmalloc_cc_library.cmake")
include("cmake/create_tcmalloc_libraries.cmake")

# Check that this is not an in-source build:
if("${PROJECT_SOURCE_DIR}" STREQUAL "${PROJECT_BINARY_DIR}")
   message(SEND_ERROR "In-source builds are not allowed.")
endif()

# Get Dependencies
##########################
hunter_add_package(abseil)
find_package(absl CONFIG REQUIRED)


set(TCMALLOC_COMMON_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}")
set(TCMALLOC_CXX_STANDARD "17")
set(LOCAL_INCLUDE_DIRECTORY "${CMAKE_CURRENT_LIST_DIR}")
set(config_install_dir "lib/cmake/tcmalloc")


add_subdirectory(tcmalloc)

# Installation
############################

set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
set(project_config "${generated_dir}/tcmallocConfig.cmake")

include(CMakePackageConfigHelpers)

configure_package_config_file(
  "cmake/Config.cmake.in"
  "${project_config}"
  INSTALL_DESTINATION "${config_install_dir}"
)

install(
    FILES "${project_config}" 
    DESTINATION "${config_install_dir}"
)

set(LOCAL_GENERATED_INCLUDE_DIRECTORY ${CMAKE_CURRENT_LIST_DIR}/lib)
install(EXPORT tcmallocTargets DESTINATION ${config_install_dir} NAMESPACE tcmalloc::)