if [[ -z $TMUX && -n $SSH_TTY && $(which tmux > /dev/null 2>&1; echo $?) == "0" ]]; then
  exec tmux new-session -A -s main
fi
