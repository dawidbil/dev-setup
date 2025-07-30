#!/bin/zsh
# watch -n1 -t "tail -$(tmux display-message -p '#{pane_height}') ~/terminal-chat-reader/chat"
tail -f ~/terminal-chat-reader/chat
