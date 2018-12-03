cmake_minimum_required(VERSION 3.12)

project(calc
    VERSION 0.1
    DESCRIPTION "very basic shared library creation
introduction")

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall")

add_library(calc SHARED addsub.cpp mul.cpp)
add_executable(main main.cpp)
target_link_libraries(main calc)
