#!/bin/bash
# install 3270 Nerd Font --> u can choose another at: https://www.nerdfonts.com/font-downloads
echo "[-] Download fonts [-]"
echo "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/3270.zip >/dev/null 2>&1
unzip 3270.zip -d ~/.fonts >/dev/null 2>&1
fc-cache -fv >/dev/null 2>&1
echo "done!"
