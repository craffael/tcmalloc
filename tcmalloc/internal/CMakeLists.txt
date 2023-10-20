


tcmalloc_cc_library(
    NAME  "allocation_guard"
    SRCS  "allocation_guard.cc"
    HDRS  "allocation_guard.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  
        "tcmalloc::config"
        # "absl::base"
        "absl::core_headers"
)

tcmalloc_cc_library(
    NAME  "atomic_danger"
    HDRS  "atomic_danger.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  "tcmalloc::config"
)

tcmalloc_cc_library(
    NAME  "atomic_stats_counter"
    HDRS  "atomic_stats_counter.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  "tcmalloc::config"
)

tcmalloc_cc_library(
    NAME  "clock"
    HDRS  "clock.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}    
    DEPS  "tcmalloc::config"
)

tcmalloc_cc_library(
    NAME  "config"
    HDRS  "config.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}    
    DEPS  
        "absl::config"
        "absl::core_headers"
)

tcmalloc_cc_library(
    NAME  "declarations"
    HDRS  "declarations.h"
)

tcmalloc_cc_library(
    NAME  "environment"
    SRCS  "environment.cc"
    HDRS  "environment.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}    
    DEPS  "tcmalloc::config"
)

tcmalloc_cc_library(
    NAME  "explicitly_constructed"
    HDRS  "explicitly_constructed.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  
        "tcmalloc::config"
)

tcmalloc_cc_library(
    NAME  "fake_profile"
    HDRS  "fake_profile.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  
        "tcmalloc::malloc_extension"
        "absl::function_ref"
        "absl::time"
)

tcmalloc_cc_library(
    NAME  "linked_list"
    HDRS  "linked_list.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
   
    DEPS  
        "tcmalloc::config"
        "tcmalloc::logging"
        "absl::core_headers"
)

tcmalloc_cc_library(
    NAME  "linux_syscall_support"
    HDRS  "linux_syscall_support.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
)

tcmalloc_cc_library(
    NAME  "logging"
    SRCS  "logging.cc"
    HDRS  "logging.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::allocation_guard"
        "tcmalloc::config"
        "tcmalloc::parameter_accessors"
        "absl::core_headers"
        "absl::stacktrace"
        "absl::strings"
        "absl::str_format"
        "absl::time"
    
)

tcmalloc_cc_library(
    NAME  "memory_stats"
    SRCS  "memory_stats.cc"
    HDRS  "memory_stats.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::config"
        "tcmalloc::logging"
        "tcmalloc::page_size"
        "tcmalloc::util"
        "absl::strings"
)

tcmalloc_cc_library(
    NAME  "mincore"
    SRCS  "mincore.cc"
    HDRS  "mincore.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    LINKSTATIC
    DEPS  
        "tcmalloc::config"
        "tcmalloc::page_size"
    
)

tcmalloc_cc_library(
    NAME  "residency"
    SRCS  "residency.cc"
    HDRS  "residency.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    LINKSTATIC
    DEPS  
        "tcmalloc::config"
        "tcmalloc::page_size"
        "tcmalloc::util"
        "absl::status"
    
)

tcmalloc_cc_library(
    NAME  "pageflags"
    SRCS  "pageflags.cc"
    HDRS  "pageflags.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    LINKSTATIC
    DEPS  
        "tcmalloc::config"
        "tcmalloc::page_size"
        "tcmalloc::util"
        "absl::core_headers"
        "absl::status"
    
)

tcmalloc_cc_library(
    NAME  "cache_topology"
    SRCS  "cache_topology.cc"
    HDRS  "cache_topology.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}    
    DEPS  
        "tcmalloc::config"
        "tcmalloc::logging"
        "tcmalloc::sysinfo"
        "tcmalloc::util"
        "absl::core_headers"
        "absl::strings"
    
)

tcmalloc_cc_library(
    NAME  "numa"
    SRCS  "numa.cc"
    HDRS  "numa.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}    
    DEPS  
        "tcmalloc::config"
        "tcmalloc::environment"
        "tcmalloc::logging"
        "tcmalloc::percpu"
        "tcmalloc::sysinfo"
        "tcmalloc::util"
        "absl::core_headers"
        "absl::function_ref"
    
)

tcmalloc_cc_library(
    NAME  "optimization"
    HDRS  "optimization.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
  
    DEPS  
        "tcmalloc::logging"
        "absl::core_headers"
    
)

tcmalloc_cc_library(
    NAME  "overflow"
    HDRS  "overflow.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::config"
        "absl::config"
    
)

tcmalloc_cc_library(
    NAME  "page_size"
    SRCS  "page_size.cc"
    HDRS  "page_size.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::config"
        "absl::base"
        "absl::core_headers"
    
)

tcmalloc_cc_library(
    NAME  "parameter_accessors"
    HDRS  "parameter_accessors.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "absl::core_headers"
        "absl::time"
    
)

tcmalloc_cc_library(
    NAME  "percpu"
    SRCS  
        "percpu.cc"
        "percpu_rseq_asm.S"
        "percpu_rseq_unsupported.cc"
    
    HDRS  "percpu.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    # See b/299621672 for detials.
    LINKSTATIC
    # textual_HDRS  
        # "percpu_rseq_aarch64.S"
        # "percpu_rseq_x86_64.S"
    
    DEPS  
        "tcmalloc::atomic_danger"
        "tcmalloc::config"
        "tcmalloc::linux_syscall_support"
        "tcmalloc::logging"
        "tcmalloc::optimization"
        "tcmalloc::sysinfo"
        "tcmalloc::util"
        "absl::base"
        "absl::core_headers"
    
)

tcmalloc_cc_library(
    NAME  "percpu_tcmalloc"
    HDRS  "percpu_tcmalloc.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}    
    DEPS  
        "tcmalloc::logging"
        "tcmalloc::mincore"
        "tcmalloc::percpu"
        "tcmalloc::sysinfo"
        "absl::base"
        "absl::core_headers"
        "absl::dynamic_annotations"
        "absl::function_ref"
    
)

tcmalloc_cc_library(
    NAME  "prefetch"
    HDRS  "prefetch.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}    
    DEPS  "tcmalloc::config"
)

# proto_library(
    # NAME  "profile_proto"
    # SRCS  "profile.proto"
# )

# cc_proto_library(
    # NAME  "profile_cc_proto"
    # visibility  "//tcmalloc:__subpackages__"
    # DEPS  ":profile_proto"
# )

# tcmalloc_cc_library(
    # NAME  "profile_builder"
    # SRCS  "profile_builder.cc"
    # HDRS  "profile_builder.h"
    # COPTS  ${TCMALLOC_DEFAULT_COPTS}
    # DEPS  
        # "tcmalloc::logging"
        # "tcmalloc::pageflags"
        # "tcmalloc::residency"
        # "tcmalloc::malloc_extension"
        # "//tcmalloc/internal:profile_cc_proto"
        # "absl::base"
        # "absl::core_headers"
        # "@com_google_absl//absl/container:btree"
        # "@com_google_absl//absl/container:flat_hash_map"
        # "@com_google_absl//absl/hash"
        # "absl::status"
        # "@com_google_absl//absl/status:statusor"
        # "absl::strings"
        # "absl::time"
        # "@com_google_absl//absl/types:span"
    
# )

tcmalloc_cc_library(
    NAME  "proc_maps"
    SRCS  "proc_maps.cc"
    HDRS  "proc_maps.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::config"
        "tcmalloc::logging"
        "tcmalloc::util"
        "absl::str_format"
    
)

tcmalloc_cc_library(
    NAME  "range_tracker"
    HDRS  "range_tracker.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::config"
        "tcmalloc::logging"
        "tcmalloc::optimization"
        "absl::bits"
    
)

tcmalloc_cc_library(
    NAME  "sampled_allocation"
    HDRS  "sampled_allocation.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  
        "tcmalloc::logging"
        "tcmalloc::sampled_allocation_recorder"
    
)

tcmalloc_cc_library(
    NAME  "sampled_allocation_recorder"
    HDRS  "sampled_allocation_recorder.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  
        "tcmalloc::config"
        "absl::base"
        "absl::core_headers"
        "absl::function_ref"
    
)

tcmalloc_cc_library(
    NAME  "stacktrace_filter"
    HDRS  "stacktrace_filter.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::logging"
        "absl::hash"
        "absl::span"
    
)

tcmalloc_cc_library(
    NAME  "sysinfo"
    SRCS  "sysinfo.cc"
    HDRS  "sysinfo.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::config"
        "tcmalloc::logging"
        "tcmalloc::util"
        "absl::base"
        "absl::core_headers"
        "absl::function_ref"
        "absl::strings"
    
)

# An empty rule to force libc malloc instead of TCMalloc.
tcmalloc_cc_library(
    NAME  "system_malloc"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    LINKSTATIC    
)

tcmalloc_cc_library(
    NAME  "timeseries_tracker"
    HDRS  "timeseries_tracker.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::clock"
        "tcmalloc::logging"
        "absl::base"
        "absl::function_ref"
        "absl::bits"
        "absl::int128"
        "absl::time"
    
)

tcmalloc_cc_library(
    NAME  "util"
    SRCS  "util.cc"
    HDRS  "util.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::config"
        "absl::time"
    
)