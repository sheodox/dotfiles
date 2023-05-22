#!/usr/bin/env bash
stow kitty

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
# download a nerd font for JetBrains Mono
mkdir -p /tmp/sheodox-dotfiles/fonts
cd /tmp/sheodox-dotfiles/fonts
curl -L -o JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/JetBrainsMono.zip
# unzip, remove windows compatible fonts
unzip JetBrainsMono.zip
rm *Windows*.ttf
# extract to local font location
mkdir -p ~/.local/share/fonts
mv *.ttf ~/.local/share/fonts
# rebuild font cache
fc-cache -f -v
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/applications
# the rest here is from https://sw.kovidgoyal.net/kitty/binary/#desktop-integration-on-linux
# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in your PATH)
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# Update the path to the kitty icon in the kitty.desktop file
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
