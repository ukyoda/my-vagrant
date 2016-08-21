#!/usr/bin/env bash


cd /usr/local
git clone git://github.com/yyuu/pyenv.git ./pyenv
#git clone git://github.com/yyuu/pyenv-virtualenv.git ./pyenv/plugins/pyenv-virtualenv

sudo cat > /etc/profile.d/pyenv.sh <<-PYENV
export PYENV_ROOT="/usr/local/pyenv"
export PATH="\${PYENV_ROOT}/bin:\${PATH}"
eval "\$(pyenv init -)"
#eval "\$(pyenv virtualenv-init -)"
PYENV

source /etc/profile.d/pyenv.sh

# Python 2.7 Install
pyenv install 2.7
pyenv global 2.7
