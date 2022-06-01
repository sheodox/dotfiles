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
	# set the home directory as the filesystem root so attachments in the home directory can be found.
	sudo flatpak override com.discordapp.Discord --filesystem=$(HOME)
	sudo flatpak override org.signal.Signal --filesystem=$(HOME)
	sudo dnf install steam 

bashrc: 
	# check to see if we've installed the dotfiles bashrc (if it's not a symlink
	# then it hasn't been installed yet)
	if ! [[ -L ~/.bashrc ]]; then\
		rm ~/.bashrc;\
		stow bashrc;\
	fi


common-desktop: bashrc mozc neovim kitty

# setup software repos
deps: 
	sudo dnf install stow
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(shell rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(shell rpm -E %fedora).noarch.rpm

kitty: deps
	sh ./install/kitty.sh

# install all the dependencies needed for Japanese input using mozc with fcitx
mozc:
	sudo dnf install fcitx5-mozc fcitx5 fcitx5-qt fcitx5-gtk fcitx5-configtool fcitx5-autostart
	stow fcitx5

# install neovim and dependencies these dotfiles use
neovim: deps node rust lua-lsp
	sudo dnf install xclip ripgrep rubygems ruby-devel
	# install language servers used by nvim-lsp
	gem install solargraph
	npm i -g typescript typescript-language-server vscode-langservers-extracted pyright svelte-language-server @prisma/language-server bash-language-server @angular/language-server
	stow neovim
	stow vim
	sudo yum -y install ninja-build libtool autoconf automake cmake gcc gcc-c++ make pkgconfig unzip patch gettext curl
	# build neovim
	mkdir -p ~/code/other
	cd ~/code/other &&\
	git clone https://github.com/neovim/neovim &&\
	cd neovim &&\
	make CMAKE_BUILD_TYPE=RelWithDebInfo &&\
	sudo make install

rust:
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs -o ~/Downloads/rustup-init.sh
	sh ~/Downloads/rustup-init.sh -y
	# lua style formatting
	cargo install stylua

lua-lsp:
	sh ./install/lua-lsp.sh

node:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
	source ~/.bashrc && nvm install 16

.PHONY: common-apps work-apps home-apps common-desktop home-desktop work-desktop bashrc deps kitty mozc neovim node rust lua-lsp
