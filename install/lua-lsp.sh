#!/usr/bin/env bash
sudo dnf install libstdc++-static
mkdir -p ~/code/other
cd ~/code/other

# check if the lsp has been checked out
if [ -d "lua-language-server" ]; then
	cd lua-language-server
	git pull
else
	git clone https://github.com/sumneko/lua-language-server
	cd lua-language-server
fi

git submodule update --init --recursive
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
