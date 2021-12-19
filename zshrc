
# Launch tmux by default
if [[ -z "$TMUX" ]]; then
  tmux new-session -A -s "$USER"
fi

# pure prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# git
compdef g=git
function g {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status --short --branch
  fi
}
