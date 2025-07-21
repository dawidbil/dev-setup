#!/bin/zsh                                                                                                   

cd ~/TankBotFight

if [ -z $1 ]
then
    SESSIONNAME="default"
else
    SESSIONNAME=$1
fi

tmux has-session -t $SESSIONNAME &> /dev/null

if [ $? != 0 ] 
then
    tmux new-session -s $SESSIONNAME -n "main" -d
    tmux send-keys -t $SESSIONNAME "nvim" Enter
    tmux split-window -v -p 20 "zsh"
    tmux select-pane -L
fi

tmux attach -t $SESSIONNAME
