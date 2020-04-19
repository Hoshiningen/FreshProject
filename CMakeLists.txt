# Set the cmake version according to your needs
cmake_minimum_required(VERSION 3.13)

# Create the project. Replace with the project's name
project(StarterProject CXX)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

# Set directory paths
set(SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/source)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})
set(CMAKE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Create the executable
add_executable(StarterProject ${SOURCE_DIR}/main.cpp)

target_include_directories(StarterProject PUBLIC
    ${SOURCE_DIR}/public)

set_target_properties(StarterProject PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO)

enable_testing()

# Don't run the google benchmark unit tests
set(BENCHMARK_ENABLE_GTEST_TEST OFF)

# Set project folders
set_target_properties(StarterProject PROPERTIES FOLDER StarterProject)

add_subdirectory(${SOURCE_DIR}/Project/public)
set_target_properties(project PROPERTIES FOLDER StarterProject/Project)

add_subdirectory(${SOURCE_DIR}/Project/private)
set_target_properties(project-lib PROPERTIES FOLDER StarterProject/Project)

add_subdirectory(${SOURCE_DIR}/Project/benchmark)
set_target_properties(project-benchmarks PROPERTIES FOLDER StarterProject/Project)

add_subdirectory(${SOURCE_DIR}/Project/test)
set_target_properties(project-tests PROPERTIES FOLDER StarterProject/Project)
