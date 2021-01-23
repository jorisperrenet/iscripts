#!/bin/bash

sudo apt install -y g++ libgtk-3-dev gtk-doc-tools gnutls-bin \
    valac intltool libpcre2-dev libglib3.0-cil-dev libgnutls28-dev \
    libgirepository1.0-dev libxml2-utils gperf build-essential

git clone https://github.com/ls4154/termite-ubuntu
cd termite-ubuntu

sh build.sh
