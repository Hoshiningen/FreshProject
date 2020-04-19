# This is the CMakeLists file for a public project. A public
# project is a public interface for a library

set(sources
    Public.cpp)

set(includes
    Public.h)

# Create the library
add_library(project STATIC ${sources} ${includes})

# Use C++17
set_target_properties(project PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO)

# Set the additional includes for the library
target_include_directories(project
    PRIVATE ${SOURCE_DIR}/private)

target_link_libraries(project PRIVATE project-lib)

# Treat warnings as errors
if(MSVC)
    target_compile_options(project PRIVATE /W4 /WX)
else()
    target_compile_options(project PRIVATE -Wall -Wextra -pedantic -Werror)
endif()