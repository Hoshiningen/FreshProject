# This is the CMakeLists file for a public project. A public
# project is a public interface for a library

set(sources
    Private.cpp)

set(includes
    Private.h)

# Create the library
add_library(project-lib STATIC ${sources} ${includes})

# Use C++17
set_target_properties(project-lib PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED YES
    CXX_EXTENSIONS NO)
    
# Set the additional includes for the library

# Treat warnings as errors
if(MSVC)
    target_compile_options(project-lib PRIVATE /W4 /WX)
else()
    target_compile_options(project-lib PRIVATE -Wall -Wextra -pedantic -Werror)
endif()