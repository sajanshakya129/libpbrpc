cmake_minimum_required(VERSION 2.8.4)
find_library(LIB_PBRPC NAMES pbrpc)
include(FindProtobuf)
find_package(Protobuf REQUIRED)
include_directories(${PROTOBUF_INCLUDE_DIR})

add_executable(test test.cpp)
target_link_libraries(test ${LIB_PBRPC}  ${PROTOBUF_LIBRARY})
