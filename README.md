# sheodox dotfiles

## Neovim Install:
* `stow`
* [`nvim`](https://neovim.io/)
* [`dein`](https://github.com/Shougo/dein.vim)
* [`silverseacher-ag`](https://github.com/ggreer/the_silver_searcher)
* [`ripgrep`](https://github.com/BurntSushi/ripgrep)
* [a patched nerd font](https://github.com/ryanoasis/nerd-fonts#font-installation)
* [`gem install solargraph`](https://github.com/castwide/solargraph)
* `npm i -g typescript typescript-language-server vscode-langservers-extracted pyright svelte-language-server @prisma/language-server @prisma/language-server`

Clone this repository to your home directory, then run `stow nvim` (replace nvim with any other directory name here).

## Kitty Install:

To install fonts:
1. Download the JetBrains Mono Nerd Font from the latest [Nerd Fonts release](https://github.com/ryanoasis/nerd-fonts/releases/latest).
2. Extract to `~/.local/share/fonts`
3. `rm *Windows*` in that directory
4. `fc-cache -f -v`
