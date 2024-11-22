#!/usr/bin/env bash

selected=$(cat ~/.tmux.projects | xargs -I {} find {} -mindepth 1 -maxdepth 1 -type d | fzf)
selected_basename=$(basename "$selected")
tmux_running=$(pgrep tmux)

if [[ -z $selected ]]; then
    exit 0
fi

if [[ -z $tmux_running ]]; then
    tmux new-session -n vim -s "$selected_basename" -c "$selected" nvim
    exit 0
fi

if [[ -z $(tmux has-session -t "$selected_basename" 2> /dev/null) ]]; then
    tmux new-session -d -n vim -s "$selected_basename" -c "$selected" nvim
fi

if [[ $TMUX ]]; then
    tmux switch-client -t "$selected_basename"
else
    tmux attach -t "$selected_basename"
fi

