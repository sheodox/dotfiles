#!/usr/bin/env bash
cd ~/code/other/neovim/
make distclean
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
