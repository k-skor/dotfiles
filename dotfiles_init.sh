#!/bin/bash

config='/usr/bin/git --git-dir='$HOME'/.cfg/ --work-tree='$HOME
echo ".cfg" >> .gitignore
git clone --bare https://github.com/k-skor/dotfiles.git $HOME/.cfg
$config config --local status.showUntrackedFiles no
echo "alias config='$config'" >> $HOME/.bashrc
