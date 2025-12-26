#!/bin/sh

# shellcheck disable=SC2046
tmux new-session -A -s $(hostname -s | tr ' ' '_')
exit $?
