# a personal use linux desktop
home-desktop: home-apps common-desktop
	@echo  "Done"

# a work user linux desktop
work-desktop: work-apps common-desktop
	@echo  "Done"

common-apps: deps
	flatpak install flathub \
		com.spotify.Client \
		com.uploadedlobster.peek
	sudo dnf install \
		vlc \
		obs-studio

work-apps: common-apps

home-apps: common-apps
	flatpak install flathub \
		com.discordapp.Discord \
		org.signal.Signal 
	sudo dnf install steam 

bashrc: 
	# check to see if we've installed the dotfiles bashrc (if it's not a symlink
	# then it hasn't been installed yet)
	if ! [[ -L ~/.bashrc ]]
	then
		rm ~/.bashrc
		stow bashrc
	fi

common-desktop: bashrc mozc neovim kitty

# setup software repos
deps: 
	sudo dnf install stow
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(shell rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(shell rpm -E %fedora).noarch.rpm

kitty: deps
	curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin launch=n
	# download a nerd font for JetBrains Mono
	mkdir -p /tmp/sheodox-dotfiles/fonts
	cd /tmp/sheodox-dotfiles/fonts
	curl -L -o JetbrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
	# unzip, remove windows compatible fonts
	unzip JetBrainsMono.zip
	rm *Windows*.ttf
	# extract to local font location
	mkdir -p ~/.local/share/fonts
	mv *.ttf ~/.local/share/fonts
	# rebuild font cache
	fc-cache -f -v
	stow kitty
	# the rest here is from https://sw.kovidgoyal.net/kitty/binary/#desktop-integration-on-linux
	# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in your PATH)
	ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
	# Place the kitty.desktop file somewhere it can be found by the OS
	cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
	# Update the path to the kitty icon in the kitty.desktop file
	sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

# install all the dependencies needed for Japanese input using mozc with fcitx
mozc:
	sudo dnf install fcitx5-mozc fcitx5 fcitx5-qt fcitx5-gtk fcitx5-configtool fcitx5-autostart
	stow fcitx5

# install neovim and dependencies these dotfiles use
neovim: deps node
	sudo dnf install xclip ripgrep
	# install language servers used by nvim-lsp
	gem install solargraph
	npm i -g typescript typescript-language-server vscode-langservers-extracted pyright svelte-language-server @prisma/language-server @prisma/language-server
	stow neovim
	# install the plugin manager dein
	mkdir -p /tmp/sheodox-dotfiles/dein
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./tmp/sheodox-dotfiles/dein/installer.sh ~/.cache/dein
	# build neovim
	sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl
	mkdir -p ~/code/other
	cd ~/code/other
	git clone https://github.com/neovim/neovim
	cd neovim
	make -j4
	sudo make install


node:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
	nvm install 14

.PHONY: common-apps work-apps home-apps common-desktop home-desktop work-desktop bashrc desktop deps kitty mozc neovim node 
