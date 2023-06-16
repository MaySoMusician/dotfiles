#!/bin/bash

cd $(dirname $0)

sudo apt-get update \
  && apt-get install -y --no-install-recommends \
  wget

mkdir -p $HOME/.omp
ln -s $PWD/omp.json $HOME/.omp/omp.json

sudo wget --progress=dot:giga \
  https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 \
  -O /usr/local/bin/oh-my-posh \
  && sudo chmod +x /usr/local/bin/oh-my-posh

echo 'eval "$(oh-my-posh --init --shell bash --config ~/.omp/omp.json)"' >> ~/.zshrc

echo '--------------------'
echo 'Dotfiles installed.'
echo ''
