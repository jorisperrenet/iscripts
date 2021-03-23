#!/bin/bash


# dependencies
sudo apt install cmake pkg-config libfreetype6-dev
                 libfontconfig1-dev libxcb-xfixes0-dev
                 python3 cargo gzip >/dev/null 2>&1

dir="/home/$USER/.local/src"; mkdir -p "$dir"
git clone "https://github.com/alacritty/alacritty.git" "$dir/alacritty" >/dev/null 2>&1
cd alacritty

# install
cargo build --release >/dev/null 2>&1

# terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info >/dev/null 2>&1

# make desktop entry
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop >/dev/null 2>&1
sudo update-desktop-database >/dev/null 2>&1

# add manual page
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz >/dev/null 2>&1
