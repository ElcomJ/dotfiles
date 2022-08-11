#!/bin/bash

tmux new-session -d -x "$(tput cols)" -y "$(tput lines)"

window=0
tmux new-window -n main
tmux send-keys -t main 'cd Cursos/CursoPythonDSA' Enter
tmux send-keys -t main 'source cursoDSAenv/bin/activate' Enter
tmux send-keys -t main 'clear' Enter
tmux send-keys -t main 'nvim' Enter
tmux split-window -v -p 25
tmux send-keys -t main 'cd Cursos/CursoPythonDSA' Enter
tmux send-keys -t main 'source cursoDSAenv/bin/activate' Enter
tmux send-keys -t main 'clear' Enter
tmux split-window -h -p 50
tmux send-keys -t main 'ncspot' Enter

window=1
tmux new-window -n ranger
tmux send-keys -t ranger 'ranger' Enter

tmux select-window -t 0:1
tmux send-keys -t 0:1 '..' Enter
tmux send-keys -t 0:1 'clear' Enter

tmux attach-session -t 0