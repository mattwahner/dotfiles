FROM archlinux

RUN pacman -Sy

# ZSH Setup
RUN pacman -S --noconfirm zsh
COPY .zshrc /root/.
RUN chsh -s /usr/bin/zsh
SHELL ["/usr/bin/zsh", "-c"]

# Setup Packages
RUN pacman -S --noconfirm git unzip

# C Setup
RUN pacman -S --noconfirm gcc make

# Deno
RUN pacman -S --noconfirm deno

# NVM Setup
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash  && \
    source /root/.zshrc && \
    nvm install 20 && \
    nvm use 20

# Typescript Setup
RUN source /root/.zshrc && \
    npm i -g typescript

# Lua Setup
RUN pacman -S --noconfirm lua

# Rust Setup
RUN pacman -S --noconfirm rustup rust-analyzer && \
    rustup default stable

# Add extra needed packages
RUN pacman -S --noconfirm \
    ripgrep \
    fzf \
    tmux \
    less \
    extra/ttf-jetbrains-mono-nerd

# Install remaining LS
RUN source /root/.zshrc && \
    npm i -g bash-language-server
RUN pacman -S --noconfirm lua-language-server

# Neovim Setup
RUN pacman -S --noconfirm neovim
RUN mkdir -p /root/.config/nvim
COPY ./mini_vim /root/.config/nvim

# Install mini and mini.deps
ARG MINI_PATH=/root/.local/share/nvim/site/pack/deps/start
ARG FZF_PATH=/root/.local/share/nvim/site/pack/deps/opt/telescope-fzf-native.nvim
RUN mkdir -p $MINI_PATH && \
    pushd $MINI_PATH && \
    git clone --filter=blob:none https://github.com/echasnovski/mini.nvim && \
    popd && \
    nvim --headless +DepsUpdate! +qa && \
    nvim --headless & sleep 20; kill -INT %+ && \
    pushd $FZF_PATH && \
    make

CMD ["/usr/bin/zsh"]

