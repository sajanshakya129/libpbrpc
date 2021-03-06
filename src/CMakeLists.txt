cmake_minimum_required(VERSION 2.8.4)

project(pbrpc)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 ")

include(FindProtobuf)
find_package(Protobuf REQUIRED)

include_directories(
    ${PROTOBUF_INCLUDE_DIRS}
    ${PROTOBUF_ROOT}/src
    ${pbrpc_proto_BINARY_DIR}
    ${pbrpc_BINARY_DIR}
)
include_directories(${CMAKE_CURRENT_BINARY_DIR})

link_directories(
    ${libprotobuf_BINARY_DIR}
)

include(GenerateExportHeader)

set(pbrpc_SRCS
    pbrpc/ServiceManager.cc
)

set(pbrpc_HDRS
    pbrpc/config.h
    pbrpc/ControllerRPC.hh
    pbrpc/MethodRPC.hh
    pbrpc/ServiceManager.hh
    pbrpc/ServiceRPC.hh
)

add_library(pbrpc STATIC ${pbrpc_SRCS})

add_dependencies(pbrpc pbrpc_proto)
target_link_libraries(pbrpc pbrpc_proto ${PROTOBUF_LIBRARY})

GENERATE_EXPORT_HEADER(pbrpc)


set(INS_INCLUDE_DIR
    "/pbrpc"
)

set(INS_TARGETS
    pbrpc
)

# Install
install(TARGETS ${INS_TARGETS}
    RUNTIME DESTINATION bin COMPONENT applications
    LIBRARY DESTINATION lib COMPONENT libraries
    ARCHIVE DESTINATION lib COMPONENT libraries
)
install(FILES 
        ${pbrpc_HDRS} ${proto_HDRS}
        ${PROJECT_BINARY_DIR}/pbrpc_export.h DESTINATION "include${INS_INCLUDE_DIR}" COMPONENT headers)




