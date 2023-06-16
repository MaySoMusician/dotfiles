#!/bin/bash

cd $(dirname $0)

sudo apt-get update \
  && apt-get install -y --no-install-recommends \
  wget

sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

mkdir -p $HOME/.omp
ln -s $PWD/omp.json $HOME/.omp/omp.json

sudo wget --progress=dot:giga \
  https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 \
  -O /usr/local/bin/oh-my-posh \
  && sudo chmod +x /usr/local/bin/oh-my-posh

echo 'eval "$(oh-my-posh init zsh --config ~/.omp/omp.json)"' >> ~/.zshrc

git config --global user.name "MaySoMusician" \
  && git config --global user.email "maysomusician@gmail.com" \
  && git config --global user.useConfigOnly true \
  && git config --global core.editor "nano" \
  && git config --global pull.ff "only"

echo '--------------------'
echo 'Dotfiles installed.'
echo ''
