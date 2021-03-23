#!/bin/sh
# Install prerequisites
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip

dir="/home/$USER/.local/src"; mkdir -p "$dir"
git clone "https://github.com/neovim/neovim" "$dir/neovim"

cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
