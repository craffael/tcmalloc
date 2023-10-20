include(CMakeParseArguments)
include(cmake/copts.cmake)
include(cmake/tcmalloc_cc_library.cmake)

# Function which imitate create_tcmalloc_libraries() from bazel...

function(create_tcmalloc_libraries)
cmake_parse_arguments(CTL
  "LINKSTATIC;ALWAYSLINK"
  "NAME"
  "SRCS;HDRS;COPTS;DEPS"
  ${ARGN}
)

# Setup a variable which contains the optional arguments so we can forward them
set(option_args_forward)
if(CTL_LINKSTATIC)
  set(option_args_forward ${option_args_forward} LINKSTATIC)
endif()
if(CTL_ALWAYSLINK)
  set(option_args_forward ${option_args_forward} ALWAYSLINK)
endif()




# {
#    "name": "8k_pages",
#    "copts": [],
# }

tcmalloc_cc_library(
  NAME "${CTL_NAME}_8k_pages"
  COPTS ${CTL_COPTS}
  LINKOPTS ${CTL_LINKOPTS}
  SRCS ${CTL_SRCS}
  HDRS ${CTL_HDRS}
  DEPS ${CTL_DEPS}
  
  ${option_args_forward}
)

# {
#   "name": "deprecated_perthread",
#   "copts": ["-DTCMALLOC_DEPRECATED_PERTHREAD"],
#   "visibility": ["//tcmalloc:tcmalloc_tests"],
# },
tcmalloc_cc_library(
  NAME "${CTL_NAME}_deprecated_perthread"
  COPTS ${CTL_COPTS} "-DTCMALLOC_DEPRECATED_PERTHREAD"
  LINKOPTS ${CTL_LINKOPTS}
  SRCS ${CTL_SRCS}
  HDRS ${CTL_HDRS}
  DEPS ${CTL_DEPS}
  
  ${option_args_forward}
)

# {
#   "name": "large_pages",
#   "copts": ["-DTCMALLOC_LARGE_PAGES"],
# },
tcmalloc_cc_library(
  NAME "${CTL_NAME}_large_pages"
  COPTS ${CTL_COPTS} "-DTCMALLOC_LARGE_PAGES"
  LINKOPTS ${CTL_LINKOPTS}
  SRCS ${CTL_SRCS}
  HDRS ${CTL_HDRS}
  DEPS ${CTL_DEPS}
  
  ${option_args_forward}
)

# {
#   "name": "256k_pages",
#   "copts": ["-DTCMALLOC_256K_PAGES"],
# }
tcmalloc_cc_library(
  NAME "${CTL_NAME}_256k_pages"
  COPTS ${CTL_COPTS} "-DTCMALLOC_256K_PAGES"
  LINKOPTS ${CTL_LINKOPTS}
  SRCS ${CTL_SRCS}
  HDRS ${CTL_HDRS}
  DEPS ${CTL_DEPS}
  
  ${option_args_forward}
)

# {
#   "name": "small_but_slow",
#   "copts": ["-DTCMALLOC_SMALL_BUT_SLOW"],
# }
tcmalloc_cc_library(
  NAME "${CTL_NAME}_small_but_slow"
  COPTS ${CTL_COPTS} "-DTCMALLOC_SMALL_BUT_SLOW"
  LINKOPTS ${CTL_LINKOPTS}
  SRCS ${CTL_SRCS}
  HDRS ${CTL_HDRS}
  DEPS ${CTL_DEPS}
  
  ${option_args_forward}
)

# {
#   "name": "numa_aware",
#   "copts": ["-DTCMALLOC_NUMA_AWARE"],
# }
tcmalloc_cc_library(
  NAME "${CTL_NAME}_numa_aware"
  COPTS ${CTL_COPTS} "-DTCMALLOC_NUMA_AWARE"
  LINKOPTS ${CTL_LINKOPTS}
  SRCS ${CTL_SRCS}
  HDRS ${CTL_HDRS}
  DEPS ${CTL_DEPS}
  
  ${option_args_forward}
)


endfunction()