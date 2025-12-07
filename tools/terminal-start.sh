#!/bin/sh

tmux new-session -A -s $(hostname -s)
exit $?
