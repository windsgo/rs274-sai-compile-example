cmake_minimum_required(VERSION 3.15)

project(sai LANGUAGES CXX)

## find rs274
if (NOT rs274_DIR)
    set(rs274_DIR ../test_rs274/install/lib/cmake/rs274/)
endif()
find_package(rs274 REQUIRED)

## find boost_python
if (NOT BOOST_ROOT)
    set(BOOST_ROOT $ENV{HOME}/Boost_1_79_0/lib/cmake/)
endif()
find_package(Boost COMPONENTS python REQUIRED)

# confirm boost_python version
if(${Boost_PYTHON_VERSION} EQUAL 2.7)
    message(STATUS  "Boost_PYTHON_VERSION:${Boost_PYTHON_VERSION} is 2.7")
else()
    message(FATAL_ERROR "Boost_PYTHON_VERSION:${Boost_PYTHON_VERSION} is not to 2.7")
endif()

## find python2.7
find_package(Python2 COMPONENTS Development REQUIRED)

## SAI Executable
add_executable(sai 
    driver.cc
    saicanon.cc
    builtin_modules.cc
)

# Define EMC2_DEFAULT_TOOLTABLE
target_compile_definitions(sai
    PRIVATE
    EMC2_DEFAULT_TOOLTABLE="${PROJECT_SOURCE_DIR}/tool/sim.tbl"
)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Link Necessary Libraries
target_link_libraries(sai
    PUBLIC
    Boost::python
    Python2::Python
    rs274::rs274
    readline
)
