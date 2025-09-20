# Boost System Config
set(Boost_SYSTEM_FOUND TRUE)
set(Boost_SYSTEM_VERSION "1.89.0")

# Create imported target
if(NOT TARGET Boost::system)
    add_library(Boost::system INTERFACE IMPORTED)
    set_target_properties(Boost::system PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "F:/3.Projects/mancan_v1/boost_1_89_0"
        INTERFACE_COMPILE_FEATURES "cxx_std_11"
    )
endif()

# Set variables for compatibility
set(Boost_SYSTEM_INCLUDE_DIRS "F:/3.Projects/mancan_v1/boost_1_89_0")
set(Boost_SYSTEM_LIBRARIES "")
set(Boost_SYSTEM_LIBRARY_DIRS "")



