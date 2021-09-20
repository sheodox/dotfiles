# sheodox dotfiles

To install: clone this repository to your home folder. Modules here can be automatically symlinked by installing [`stow`](https://www.gnu.org/software/stow/) through your OS's package manager and using it by running `stow neovim` (replace `neovim` with any folder here to symlink that program's configurations).

## Neovim Dependencies:

* [`nvim`](https://neovim.io/)
* [`dein`](https://github.com/Shougo/dein.vim)
* [`ripgrep`](https://github.com/BurntSushi/ripgrep)
* [A patched nerd font](https://github.com/ryanoasis/nerd-fonts#font-installation)
* [`gem install solargraph`](https://github.com/castwide/solargraph)
* `npm i -g typescript typescript-language-server vscode-langservers-extracted pyright svelte-language-server @prisma/language-server @prisma/language-server`

## Kitty Dependencies:

To install fonts:
1. Download the JetBrains Mono Nerd Font from the latest [Nerd Fonts release](https://github.com/ryanoasis/nerd-fonts/releases/latest).
2. Extract to `~/.local/share/fonts`
3. `rm *Windows*` in that directory
4. `fc-cache -f -v`
