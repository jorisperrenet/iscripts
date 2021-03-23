#!/bin/sh

node_install() {
    curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
    sudo apt install -y nodejs >/dev/null 2>&1
}

# Make sure node is installed.
[ -z $(command -v node) ] && node_install
# Install npm
sudo apt install -y npm
sudo npm install -g npm

# Python
sudo npm install -g pyright
# Typescript
sudo npm install -g typescript typescript-language-server
