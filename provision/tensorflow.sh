#!/usr/bin/env bash

PYTHON_CONFIGURE_OPTS="--enable-unicode=ucs4" pyenv install 2.7.10
pyenv global 2.7.10
pip install https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.5.0-cp27-none-linux_x86_64.whl
