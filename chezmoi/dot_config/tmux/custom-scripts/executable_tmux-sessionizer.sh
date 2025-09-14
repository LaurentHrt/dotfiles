#!/usr/bin/env bash

include_folders=(
    "$HOME/.config"
    "$HOME/workspace"
    "$HOME/workspace/*"
)

exclude_folders=()

# Build find command parts
include_paths=$(printf "%s " "${include_folders[@]}")
exclude_args=()
for folder in "${exclude_folders[@]}"; do
    exclude_args+=(-path "$folder" -prune -o)
done

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find $include_paths -mindepth 1 -maxdepth 1 -type d "${exclude_args[@]}" -print | fzf)
fi

# Ensure selected is not empty
if [[ -z "$selected" ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z "$TMUX" && -z "$tmux_running" ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
