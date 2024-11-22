# My Dotfiles

## Setup

### List of required programs (that I can remember)

#### [NVM](https://github.com/nvm-sh/nvm)
```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
nvm install 22
nvm use 22
nvm alias default 22
```

#### [Homebrew](https://brew.sh/)
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

#### [neovim](https://formulae.brew.sh/formula/neovim)
`brew install neovim`

#### [tmux](https://formulae.brew.sh/formula/tmux)
`brew install tmux`

#### [fzf](https://formulae.brew.sh/formula/fzf)
`brew install fzf`

#### Language Servers

##### [Lua Language Server](https://formulae.brew.sh/formula/lua-language-server)
`brew install lua-language-server`
##### Rust Analyzer
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup default stable
```

##### [ESLint](https://github.com/hrsh7th/vscode-langservers-extracted)
`npm i -g vscode-langservers-extracted`

##### [ts_ls](https://github.com/typescript-language-server/typescript-language-server)
`npm i -g typescript typescript-language-server`

##### [bashls](https://github.com/bash-lsp/bash-language-server)
`npm i -g bash-language-server`

### Files

Make sure to make a `.tmux.projects` file in the home directory.
`tmux-sessionizer.bash` will use this to figure out which directories it should display to be picked.

