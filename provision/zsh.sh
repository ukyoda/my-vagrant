#!/bin/sh

# zsh install
sudo yum install -y zsh
# oh-my-zsh install
sudo -u vagrant git clone git://github.com/robbyrussell/oh-my-zsh.git ~vagrant/.oh-my-zsh
cd ~vagrant
sudo -u vagrant cp -ip .oh-my-zsh/templates/zshrc.zsh-template ~vagrant/.zshrc
# change shell 
sudo -u root chsh vagrant -s /bin/zsh
