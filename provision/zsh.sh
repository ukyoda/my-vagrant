#!/usr/bin/env bash

# zsh install
sudo yum install -y zsh

## 以下、zshを賢く使うためのフレームワークインストール。
## oh-my-zsh or preztoのどちらかを選択

# oh-my-zsh install
#####################################

#sudo -u vagrant git clone git://github.com/robbyrussell/oh-my-zsh.git ~vagrant/.oh-my-zsh
#cd ~vagrant
#sudo -u vagrant cp -ip .oh-my-zsh/templates/zshrc.zsh-template ~vagrant/.zshrc

# prezto install
#####################################

INSTALL_SHELL=/tmp/zprezto_install.sh
cat > ${INSTALL_SHELL} <<-EOC
#!/usr/bin/env zsh

ZDOTDIR=/home/vagrant
git clone --recursive https://github.com/sorin-ionescu/prezto.git "\${ZDOTDIR:-\${HOME}}/.zprezto"
mkdir \${ZDOTDIR}/.zsh_backup
mv .zlogin .zlogout .zprofile .zshenv .zshrc \${ZDOTDIR}/.zsh_backup
setopt EXTENDED_GLOB
for rcfile in "\${ZDOTDIR:-\$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "\$rcfile" "\${ZDOTDIR:-\$HOME}/.\${rcfile:t}"
done
EOC
sudo chmod a+x ${INSTALL_SHELL}
sudo -u vagrant zsh ${INSTALL_SHELL}
sudo rm -rf ${INSTALL_SHELL}

# change shell
sudo -u root chsh vagrant -s /bin/zsh
