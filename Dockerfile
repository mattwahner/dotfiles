FROM archlinux

RUN pacman -Sy

# ZSH Setup
RUN pacman -S --noconfirm zsh
COPY .zshrc /root/.
RUN chsh -s /usr/bin/zsh
SHELL ["/usr/bin/zsh", "-c"]

# Helpful packages
RUN pacman -S --noconfirm unzip

# Git Setup
RUN pacman -S --noconfirm git

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
RUN pacman -S --noconfirm ripgrep

# Install remaining LS
RUN source /root/.zshrc && \
    npm i -g bash-language-server
RUN pacman -S --noconfirm lua-language-server

# Neovim setup
RUN pacman -S --noconfirm neovim
RUN mkdir -p /root/.config/nvim
COPY ./new_nvim /root/.config/nvim
RUN nvim --headless "+Lazy! sync" +qa

CMD ["/usr/bin/zsh"]

