#!/bin/bash
g++ -o test  test.cpp /usr/local/lib/libpbrpc.a `pkg-config --cflags --libs protobuf`
