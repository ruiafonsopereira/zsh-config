#!/bin/sh
#
# Attach or create tmux session named the same as current directory.
# It is the same thing as follows:
# * tmux new -s `basename $PWD`
#
# Workflow:
# * Use 'tat' to create ow attach a session;
# * Use <prefix> d to detach the session.

path_name="$(basename "$PWD" | tr . -)"
session_name=${1-$path_name}

not_in_tmux() {
  [ -z "$TMUX" ]
}

session_exists() {
  tmux list-sessions | sed -E 's/:.*$//' | grep -q "^$session_name$"
}

create_detached_session() {
  (TMUX='' tmux new-session -Ad -s "$session_name")
}

create_if_needed_and_attach() {
  if not_in_tmux; then
    tmux new-session -As "$session_name"
  else
    if ! session_exists; then
      create_detached_session
    fi
    tmux switch-client -t "$session_name"
  fi
}

create_if_needed_and_attach
