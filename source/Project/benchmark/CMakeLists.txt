# This is a benchmark CMakeLists file. This sets up the
# project to have benchmarks made against the library

include(${CMAKE_DIR}/LinkGBenchmark.cmake)

# List your source files here
set(sources
    Benchmark.cpp)

# List your headers here
set(includes
    Benchmark.h)

add_executable(project-benchmarks ${sources} ${includes})

target_include_directories(project-benchmarks PRIVATE
    #${CMAKE_CURRENT_SOURCE_DIR}
    ${SOURCE_DIR}/Project/public
    ${SOURCE_DIR}/Project/private)

# Link things
LinkGBenchmark(project-benchmarks PRIVATE)

target_link_libraries(project-benchmarks PRIVATE project project-lib)
add_dependencies(project-benchmarks project project-lib)

set_target_properties(project-benchmarks PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO)

# Ignore warnings
if(MSVC)
    target_compile_options(project-benchmarks PRIVATE /w)
else()
    target_compile_options(project-benchmarks PRIVATE -w)
endif()