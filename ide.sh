#!/bin/zsh                                                                                                   

SESSIONNAME="your-project"
tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ] 
then
    tmux new-session -s $SESSIONNAME -n "main" -d
    tmux send-keys -t $SESSIONNAME "nvim" Enter
    tmux split-window -v -p 20 "zsh"
    tmux split-window -h -p 10 "zsh"
    tmux select-pane -L
fi

tmux attach -t $SESSIONNAME
