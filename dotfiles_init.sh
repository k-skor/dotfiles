#!/bin/bash

config='/usr/bin/git --git-dir='$HOME'/.cfg/ --work-tree='$HOME
echo ".cfg" >> .gitignore
git clone --bare https://github.com/k-skor/dotfiles.git $HOME/.cfg
$config config --local status.showUntrackedFiles no

mkdir -p .config-backup && \
$config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
res=${PIPESTATUS[0]}
echo "Repository checkout result: $res"
if [ $res -ne 0 ]; then $config checkout; fi

echo "alias config='$config'" >> $HOME/.bashrc
