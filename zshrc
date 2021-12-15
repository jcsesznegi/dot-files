
# Launch tmux by default
if [[ -z "$TMUX" ]]; then
  tmux new-session -A -s "$USER"
fi
