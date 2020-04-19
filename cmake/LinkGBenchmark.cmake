include(FetchContent)

macro(LinkGBenchmark TARGET ACCESS)
    FetchContent_Declare(
        googlebenchmark
        GIT_REPOSITORY https://github.com/google/benchmark.git
        GIT_TAG v1.5.0
    )

    FetchContent_GetProperties(googlebenchmark)

    if (NOT googlebenchmark_POPULATED)
        FetchContent_Populate(googlebenchmark)

        # This excludes google benchmark from being rebuilt and ALL_BUILD is built
        # it will only be built when a target is built that has a dependency
        # on google benchmark
        add_subdirectory(
            ${googlebenchmark_SOURCE_DIR}
            ${googlebenchmark_BINARY_DIR}
            EXCLUDE_FROM_ALL)

        # Set the target's folders
        set_target_properties(benchmark PROPERTIES FOLDER ${PROJECT_NAME}/thirdparty)
        set_target_properties(benchmark_main PROPERTIES FOLDER ${PROJECT_NAME}/thirdparty)
    endif()

    target_link_libraries(${TARGET} ${ACCESS} benchmark_main)

    add_dependencies(${TARGET} benchmark_main)
endmacro()