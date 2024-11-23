# My Dotfiles

## Setup

### Terminal Items

Likely can use the terminal colors settings in the `extras` folder
[here](https://github.com/folke/tokyonight.nvim/tree/main/extras).

For settting Windows Terminal, find the corresponding json in the `extras` folder above, and
enter it under "schemas" list in
`{USERNAME}\AppDate\Local\Packages\Microsoft.WindowsTerminal(...)\LocalState\settings.json`.

Currently like using the
[JetBrainsMono Nerd Font](https://www.nerdfonts.com/font-downloads)
(which also enables powerline stuff).

### List of required programs (that I can remember)

[NVM](https://github.com/nvm-sh/nvm)  
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 22
nvm use 22
nvm alias default 22
```

[Homebrew](https://brew.sh/)  
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

[neovim](https://formulae.brew.sh/formula/neovim)  
`brew install neovim`

[tmux](https://formulae.brew.sh/formula/tmux)  
`brew install tmux`

[fzf](https://formulae.brew.sh/formula/fzf)  
`brew install fzf`

[pipx](https://github.com/pypa/pipx)  
`brew install pipx`

[powerline-shell](https://github.com/b-ryan/powerline-shell)  
`pipx install powerline-shell`

[eza](https://github.com/eza-community/eza)
`brew install eza`

#### Language Servers

[Lua Language Server](https://formulae.brew.sh/formula/lua-language-server)  
`brew install lua-language-server`

Rust Analyzer  
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
```

[ts_ls](https://github.com/typescript-language-server/typescript-language-server)  
`npm i -g typescript typescript-language-server`

[bashls](https://github.com/bash-lsp/bash-language-server)  
`npm i -g bash-language-server`

[pyright](https://github.com/microsoft/pyright)
`npm i -g pyright`

### Files

Make sure to make a `.tmux.projects` file in the home directory.
`tmux-sessionizer.bash` will use this to figure out which directories it should display to be picked.

The file `.zprofile.example` will hold an example of the `.zprofile` file with added necessary vars in it.

### Symlinks

Here is an example of a symbolic link I can run to connect directories to this repo, wherever I clone it.  
`ln -s <path to item in repo> <name of link>`

Things that I should probably symlink:
- nvim -> ~/.config/nvim
- scripts -> ~/.local/scripts
- powerline-shell -> ~/.local/powerline-shell
- eza -> ~/.local/eza
- .tmux.conf
- .zprofile (can name it .zprofile.dotfiles and source it from .zprofile)
- .zshrc (^)

### Other Helpful Programs

[tlrc](https://github.com/tldr-pages/tlrc) - Helpful TLDR pages  
`brew install tlrc`

