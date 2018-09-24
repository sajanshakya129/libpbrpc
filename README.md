# Libpbrpc Library
This project was forked from https://github.com/madwyn/libpbrpc project. Minor problems were fixed to make it working and installable.

The aim is to build a minimal protobuf RPC lib using [Google's Protocol Buffers](https://code.google.com/p/protobuf).

Libpbrpc is Remote Procedure Call (RPC) using protobuf. It is flexible as it is not bound to the http server, it's a lightweight middleware.

## Dependencies
To install libpbrpc on the system you need to install following dependencies first
### Protocol buffer library
Follow the following link and [install protobuf](https://github.com/protocolbuffers/protobuf/blob/master/src/README.md)
Or follow the following steps
```
$ git clone https://github.com/protocolbuffers/protobuf.git
$ cd protobuf
$ git submodule update --init --recursive
$ ./autogen.sh

$ ./configure
$ make
$ make check
$ sudo make install
$ sudo ldconfig # refresh shared library cache.
```

### Cmake (only if cmake is not installed in your system)
To install cmake
	sudo apt-get install cmake


## Install library
###  Install proto files
```
./install/sh
```

### Install library
```
mkdir build && cd build
cmake ..
make
sudo make install
```
# How to use
To use this lib is really simple. First define `ServiceManager` some where in your code.
```c
ServiceManager srvMan;
```

Then the `ServiceManager` only provides two functions:

1. Register a service:
    ```c
    void regService(Service *service);
    ```

2. Handle the RPC message:
    ```c
    void handleRPC(const char *data, const size_t len, string &ret);
    ```
    - `data` is the raw Protobuf binary,
    - `len` is the length of the data,
    - `ret` is the result generated, you can send it back directly. (Note: use ret.length() to get the correct length.)

# How it's made
The over all design is really simple:
- Protocol. The RPC protocol is defined in the "pbrpc.proto" file. The protocol took the [JSON RPC 2.0](http://www.jsonrpc.org/specification) as a reference.
- `Service`s. The RPC server provides several `Service`s, and each `Service` has some `Method`s.
- `Method`s. Each `Method` should have input(`params`) and output(`results`).

# Examples
Please take a look at other forked repository https://github.com/sajanshakya129/pbrpc from origininal repo [pbrpc](https://github.com/madwyn/pbrpc) as a demo which implements a simple RPC server.
Few build problems has been solved to make it run.

# Limitations
One major limitation of this library is it's synchronous. It is possible to adapt task queue for asynchronous message handling. 
