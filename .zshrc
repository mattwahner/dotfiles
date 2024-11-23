
# VIM setup
export VISUAL=nvim
export EDITOR=nvim
alias vi="nvim"
alias vim="nvim ."

# Utility commands
alias ..="cd .."
alias ll="eza --color=always --long --git --icons --no-time --no-user --no-permissions --all --no-filesize --sort=type"
alias lls="eza --color=always --long --git --icons --no-time --no-user --no-permissions --all --total-size --sort=type"

bindkey -s ^f "bash ~/.local/scripts/tmux-sessionizer.bash\n"

eval "$(fzf --zsh)"

# Powerline

function powerline_precmd() {
    PS1="$(powerline-shell --shell zsh $?)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}

if [ "$TERM" != "linux" -a -x "$(command -v powerline-shell)" ]; then
    install_powerline_precmd
fi

