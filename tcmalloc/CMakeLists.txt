add_subdirectory(internal)

tcmalloc_cc_library(
  NAME "experiment"
  SRCS "experiment.cc"
  HDRS 
        "experiment.h"
        "experiment_config.h"
  COPTS ${TCMALLOC_DEFAULT_OPTS}
  DEPS 
        "tcmalloc::malloc_extension"
        "tcmalloc::environment"
        "tcmalloc::logging"
        "absl::core_headers"
        "absl::strings"
        "absl::optional"
)

# This library provides tcmalloc always
tcmalloc_cc_library(
 NAME "tcmalloc"
 SRCS 
        "libc_override.h"
        "tcmalloc.cc"
        "tcmalloc.h"
 COPTS ${TCMALLOC_DEFAULT_OPTS}
 LINKSTATIC
 PUBLIC
 DEPS ${${tcmalloc_DEPS}} 
        "tcmalloc::common_8k_pages"
    
  ALWAYSLINK
)


tcmalloc_cc_library(
  NAME "tcmalloc_internal_methods_only"
   SRCS 
        "tcmalloc.cc"
        "tcmalloc.h"
    
  COPTS ${TCMALLOC_DEFAULT_OPTS} "-DTCMALLOC_INTERNAL_METHODS_ONLY"
  LINKSTATIC
  DEPS ${${tcmalloc_DEPS}} 
        "tcmalloc::common_8k_pages"
    
  ALWAYSLINK
)

# Provides tcmalloc always; use per-thread mode.
tcmalloc_cc_library(
    NAME  "tcmalloc_deprecated_perthread"
    SRCS  
        "libc_override.h"
        "tcmalloc.cc"
        "tcmalloc.h"
    
    COPTS  "-DTCMALLOC_DEPRECATED_PERTHREAD"  ${TCMALLOC_DEFAULT_COPTS}
    LINKSTATIC
    DEPS  ${tcmalloc_DEPS}  
        "tcmalloc::common_deprecated_perthread"
    
    ALWAYSLINK
)

tcmalloc_cc_library(
    NAME  "size_class_info"
    HDRS  "size_class_info.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}    
)

create_tcmalloc_libraries(
    NAME  "common"
    SRCS  
        "allocation_sample.cc"
        "arena.cc"
        "arena.h"
        "background.cc"
        "central_freelist.cc"
        "central_freelist.h"
        "common.cc"
        "common.h"
        "cpu_cache.cc"
        "cpu_cache.h"
        "deallocation_profiler.cc"
        "experimental_pow2_size_class.cc"
        "global_stats.cc"
        "guarded_allocations.h"
        "guarded_page_allocator.cc"
        "guarded_page_allocator.h"
        "hinted_tracker_lists.h"
        "huge_address_map.cc"
        "huge_allocator.cc"
        "huge_allocator.h"
        "huge_cache.cc"
        "huge_cache.h"
        "huge_page_aware_allocator.cc"
        "huge_page_aware_allocator.h"
        "huge_page_filler.h"
        "huge_pages.h"
        "huge_region.h"
        "legacy_size_classes.cc"
        "page_allocator.cc"
        "page_allocator.h"
        "page_allocator_interface.cc"
        "page_allocator_interface.h"
        "page_heap.cc"
        "page_heap.h"
        "page_heap_allocator.h"
        "pagemap.cc"
        "pagemap.h"
        "parameters.cc"
        "peak_heap_tracker.cc"
        "sampler.cc"
        "sampler.h"
        "segv_handler.cc"
        "segv_handler.h"
        "size_classes.cc"
        "sizemap.cc"
        "span.cc"
        "span.h"
        "span_stats.h"
        "stack_trace_table.cc"
        "stack_trace_table.h"
        "static_vars.cc"
        "static_vars.h"
        "stats.cc"
        "system-alloc.cc"
        "system-alloc.h"
        "thread_cache.cc"
        "thread_cache.h"
        "transfer_cache.cc"
        "transfer_cache.h"
        "transfer_cache_internals.h"
        "transfer_cache_stats.h"
    
    HDRS  
        "allocation_sample.h"
        "allocation_sampling.h"
        "arena.h"
        "central_freelist.h"
        "common.h"
        "cpu_cache.h"
        "deallocation_profiler.h"
        "global_stats.h"
        "guarded_allocations.h"
        "guarded_page_allocator.h"
        "hinted_tracker_lists.h"
        "huge_address_map.h"
        "huge_allocator.h"
        "huge_cache.h"
        "huge_page_aware_allocator.h"
        "huge_page_filler.h"
        "huge_pages.h"
        "huge_region.h"
        "page_allocator.h"
        "page_allocator_interface.h"
        "page_heap.h"
        "page_heap_allocator.h"
        "pagemap.h"
        "pages.h"
        "parameters.h"
        "peak_heap_tracker.h"
        "sampled_allocation_allocator.h"
        "sampler.h"
        "segv_handler.h"
        "sizemap.h"
        "span.h"
        "span_stats.h"
        "stack_trace_table.h"
        "static_vars.h"
        "stats.h"
        "system-alloc.h"
        "tcmalloc_policy.h"
        "thread_cache.h"
        "transfer_cache.h"
        "transfer_cache_internals.h"
        "transfer_cache_stats.h"
    
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    LINKSTATIC
    DEPS  
        "tcmalloc::experiment"
        "tcmalloc::malloc_extension"
        "tcmalloc::malloc_tracing_extension"
        "tcmalloc::metadata_allocator"
        "tcmalloc::new_extension"
        "tcmalloc::size_class_info"
        
        "tcmalloc::allocation_guard"
        "tcmalloc::atomic_stats_counter"
        "tcmalloc::cache_topology"
        "tcmalloc::clock"
        "tcmalloc::config"
        "tcmalloc::environment"
        "tcmalloc::explicitly_constructed"
        "tcmalloc::linked_list"
        "tcmalloc::logging"
        "tcmalloc::memory_stats"
        "tcmalloc::mincore"
        "tcmalloc::numa"
        "tcmalloc::optimization"
        "tcmalloc::page_size"
        "tcmalloc::parameter_accessors"
        "tcmalloc::percpu"
        "tcmalloc::percpu_tcmalloc"
        "tcmalloc::prefetch"
        "tcmalloc::range_tracker"
        "tcmalloc::sampled_allocation"
        "tcmalloc::sampled_allocation_recorder"
        "tcmalloc::stacktrace_filter"
        "tcmalloc::sysinfo"
        "tcmalloc::timeseries_tracker"
        "tcmalloc::util"
        
        "absl::algorithm_container"
        "absl::base"
        "absl::config"
        "absl::core_headers"
        "absl::dynamic_annotations"
        "absl::fixed_array"
        "absl::flat_hash_map"
        "absl::stacktrace"
        "absl::hash"
        "absl::memory"
        "absl::bits"
        "absl::strings"
        "absl::str_format"
        "absl::time"
        "absl::optional"
        "absl::span"
    
    ALWAYSLINK
)

# TEMPORARY. WILL BE REMOVED.
# Add a dep to this if you want your binary to use hugepage-aware
# allocator.
tcmalloc_cc_library(
    NAME  "want_hpaa"
    SRCS  "want_hpaa.cc"
    COPTS  "-g0"  ${TCMALLOC_DEFAULT_COPTS}
    PUBLIC
    DEPS  
        "tcmalloc::config"
        "absl::core_headers"
    
    ALWAYSLINK
)

# TEMPORARY. WILL BE REMOVED.
# Add a dep to this if you want your binary to use hugepage-aware
# allocator with hpaa_subreleasetrue.
tcmalloc_cc_library(
    NAME  "want_hpaa_subrelease"
    SRCS  "want_hpaa_subrelease.cc"
    COPTS  "-g0"  ${TCMALLOC_DEFAULT_COPTS}
    PUBLIC
    DEPS  
        "tcmalloc::config"
        "absl::core_headers"
    
    ALWAYSLINK
)

# TEMPORARY. WILL BE REMOVED.
# Add a dep to this if you want your binary to not use hugepage-aware
# allocator.
tcmalloc_cc_library(
    NAME  "want_no_hpaa"
    SRCS  "want_no_hpaa.cc"
    COPTS  "-g0"  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::config"
        "absl::core_headers"
    
    ALWAYSLINK
)

tcmalloc_cc_library(
    NAME  "want_disable_huge_region_more_often"
    SRCS  "want_disable_huge_region_more_often.cc"
    COPTS  "-g0"  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  "absl::core_headers"
    ALWAYSLINK
)

# Add a dep to this if you want your binary to enable NUMA awareness by
# default.
tcmalloc_cc_library(
    NAME  "want_numa_aware"
    SRCS  "want_numa_aware.cc"
    COPTS  "-g0"  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::config"
        "absl::core_headers"
    
    ALWAYSLINK
)

# TCMalloc with large pages is usually faster but fragmentation is higher.  See
# https://github.com/google/tcmalloc/tree/master/docs/tuning.md for more details.
tcmalloc_cc_library(
    NAME  "tcmalloc_large_pages"
    SRCS  
        "libc_override.h"
        "tcmalloc.cc"
        "tcmalloc.h"
    
    COPTS  "-DTCMALLOC_LARGE_PAGES"  ${TCMALLOC_DEFAULT_COPTS}
    PUBLIC
    LINKSTATIC
    DEPS  ${tcmalloc_DEPS}  
        "tcmalloc::common_large_pages"
        "tcmalloc::allocation_guard"
        "tcmalloc::overflow"
        "tcmalloc::page_size"
    
    ALWAYSLINK
)

# TCMalloc with 256k pages is usually faster but fragmentation is higher.  See
# https://github.com/google/tcmalloc/tree/master/docs/tuning.md for more details.
tcmalloc_cc_library(
    NAME  "tcmalloc_256k_pages"
    SRCS  
        "libc_override.h"
        "tcmalloc.cc"
        "tcmalloc.h"
    
    COPTS  "-DTCMALLOC_256K_PAGES"  ${TCMALLOC_DEFAULT_COPTS}
    PUBLIC
    LINKSTATIC
    DEPS  ${tcmalloc_DEPS}  
        "tcmalloc::common_256k_pages"
        "tcmalloc::allocation_guard"
        "tcmalloc::overflow"
        "tcmalloc::page_size"
    
    ALWAYSLINK
)

# TCMalloc small-but-slow is a a version of TCMalloc that chooses to minimize
# fragmentation at a *severe* cost to performance.  It should be used by
# applications that have significant memory constraints but don't need to
# frequently allocate/free objects.
#
# See https://github.com/google/tcmalloc/tree/master/docs/tuning.md for more details.
tcmalloc_cc_library(
    NAME  "tcmalloc_small_but_slow"
    SRCS  
        "libc_override.h"
        "tcmalloc.cc"
        "tcmalloc.h"
    
    COPTS  "-DTCMALLOC_SMALL_BUT_SLOW"  ${TCMALLOC_DEFAULT_COPTS}
    LINKSTATIC
    DEPS  ${tcmalloc_DEPS}  
        "tcmalloc::common_small_but_slow"
        "tcmalloc::allocation_guard"
        "tcmalloc::overflow"
        "tcmalloc::page_size"
    
    ALWAYSLINK
)

# TCMalloc with NUMA awareness compiled in. Note that by default NUMA awareness
# will still be disabled at runtime - this default can be changed by adding a
# dependency upon want_numa_aware or overridden by setting the
# TCMALLOC_NUMA_AWARE environment variable.
tcmalloc_cc_library(
    NAME  "tcmalloc_numa_aware"
    SRCS  
        "libc_override.h"
        "tcmalloc.cc"
        "tcmalloc.h"
    
    COPTS  "-DTCMALLOC_NUMA_AWARE"  ${TCMALLOC_DEFAULT_COPTS}
    LINKSTATIC
    DEPS  ${tcmalloc_DEPS}  
        "tcmalloc::common_numa_aware"
        "tcmalloc::allocation_guard"
        "tcmalloc::overflow"
        "tcmalloc::page_size"
    
    ALWAYSLINK
)

tcmalloc_cc_library(
    NAME  "metadata_allocator"
    HDRS  "metadata_allocator.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  
        "absl::core_headers"
    
)

tcmalloc_cc_library(
    NAME  "malloc_extension"
    SRCS  "malloc_extension.cc"
    HDRS  
        "internal_malloc_extension.h"
        "malloc_extension.h"
    
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    PUBLIC
    DEPS  
        "tcmalloc::parameter_accessors"
        "absl::base"
        "absl::config"
        "absl::core_headers"
        "absl::malloc_internal"
        "absl::function_ref"
        "absl::memory"
        "absl::strings"
        "absl::time"
        "absl::optional"
        "absl::span"
    
)

tcmalloc_cc_library(
    NAME  "malloc_tracing_extension"
    SRCS  "malloc_tracing_extension.cc"
    HDRS  
        "internal_malloc_tracing_extension.h"
        "malloc_tracing_extension.h"
    
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    DEPS  
        "absl::status"
        "absl::statusor"
    
)

tcmalloc_cc_library(
    NAME  "new_extension"
    SRCS  "new_extension.cc"
    HDRS  "new_extension.h"
    COPTS  ${TCMALLOC_DEFAULT_COPTS}
    
    DEPS  
        "tcmalloc::malloc_extension"
        "absl::core_headers"
    
)

# Disable because it would require protobuf support:
#####################################################
# tcmalloc_cc_library(
    # NAME  "profile_marshaler"
    # SRCS  "profile_marshaler.cc"
    # HDRS  "profile_marshaler.h"
    # COPTS  ${TCMALLOC_DEFAULT_COPTS}
    # visibility  "//visibility:public"
    # DEPS  
        # "tcmalloc::malloc_extension"
        # "tcmalloc::profile_builder"
        # "@com_google_absl//absl/status:statusor"
        # "@com_google_protobuf//:protobuf"
    
# )

# cc_test(
    # NAME  "profile_marshaler_test"
    # SRCS  "profile_marshaler_test.cc"
    # COPTS  ${TCMALLOC_DEFAULT_COPTS}
    # DEPS  
        # "tcmalloc::malloc_extension"
        # ":profile_marshaler"
        # "tcmalloc::fake_profile"
        # "tcmalloc::profile_cc_proto"
        # "absl::memory"
        # "@com_google_absl//absl/status:statusor"
        # "absl::strings"
        # "absl::time"
        # "@com_google_googletest//:gtest_main"
        # "@com_google_protobuf//:protobuf"
    
# )

# TEMPORARY. WILL BE REMOVED.
# Add a dep to this if you want your binary to use old size classes.
tcmalloc_cc_library(
    NAME  "want_legacy_size_classes"
    SRCS  "want_legacy_size_classes.cc"
    COPTS  "-g0"  ${TCMALLOC_DEFAULT_COPTS}
    PUBLIC
    DEPS  
        "absl::core_headers"
    
    ALWAYSLINK
)