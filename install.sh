#! /bin/bash
echo installing proto files
mkdir -p proto/build && cd proto/build
cmake ..
make
sudo make install



