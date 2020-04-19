# This is a unit test CMakeLists file. This sets up the
# project to have unit tests made against the library

include(${CMAKE_DIR}/LinkGTest.cmake)
include(GoogleTest)

# List your source files here
set(sources
    Tests.cpp)

# List your headers here
set(includes
    Tests.h)

add_executable(project-tests ${sources} ${includes})

target_include_directories(project-tests
    PRIVATE ${SOURCE_DIR}/Project/public
    PRIVATE ${SOURCE_DIR}/Project/private)

# Link things
LinkGTest(project-tests PRIVATE)

target_link_libraries(project-tests PRIVATE project project-lib)
add_dependencies(project-tests project project-lib)

set_target_properties(project-tests PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO)

# Ignore warnings
if(MSVC)
    target_compile_options(project-tests PRIVATE /w)
else()
    target_compile_options(project-tests PRIVATE -w)
endif()

gtest_add_tests(
    TARGET project-tests
    SOURCES ${sources}
    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/$<CONFIG>)