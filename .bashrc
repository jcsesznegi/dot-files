alias clr='clear'
alias ll='ls --group-directories-first -hl'
alias la='ll -a'

alias gst='git status -sb'
alias gco='git checkout'
alias gcb='gco -b'
alias gcm='git commit -m'
alias gd='git diff'
alias ga='git add'
alias gb='git branch'

# Launch tmux by default
if [[ -z "$TMUX" ]]; then
  tmux new-session -A -s "$USER"
fi
