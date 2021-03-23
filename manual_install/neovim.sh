# Install prerequisites
sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip >/dev/null 2>&1

dir="/home/$USER/.local/src"; mkdir -p "$dir"
git clone "https://github.com/neovim/neovim" "$dir/neovim" >/dev/null 2>&1

cd neovim
make CMAKE_BUILD_TYPE=Release >/dev/null 2>&1
sudo make install >/dev/null 2>&1
