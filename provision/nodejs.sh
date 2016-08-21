#!/usr/bin/env bash

WORK_DIR=/usr/local/nodebrew
RC_FILE="/home/vagrant/.zshrc"
mkdir ${WORK_DIR}
cd ${WORK_DIR}
wget git.io/nodebrew
export NODEBREW_ROOT=${WORK_DIR}
perl nodebrew setup

cat >> /etc/profile.d/nodebrew.sh <<EOF
export PATH=${WORK_DIR}/current/bin:\$PATH
export NODEBREW_ROOT=${WORK_DIR}
EOF

source /etc/profile.d/nodebrew.sh
nodebrew selfupdate
nodebrew install-binary stable
nodebrew use stable

sudo -i -u vagrant source ${RC_FILE}

# bowerのインストール
npm install -g bower
# lesscのインストール
npm install -g less
