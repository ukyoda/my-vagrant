# TensorFlow 環境作成 Vagrantfile

このファイルはVagrantを使ってTensorflowの環境をささっと構築するVagrantfileです。


## 仮想マシン環境

* OS: CentOS7
* インストールするミドルウェア
    * git
    * zsh
    * pyenv
    * pyenv-virtualenv
    * Python 2.7
    * Python 2.7.10 (global)
    * tensor-flow

## 必要なもの

* VirtualBox
* Vagrant
* Atlasのアカウント

## 使い方

1. VirtualBox + Vagrantの環境を作成
2. 「vagrant login」でAtlasにログイン
3. このリポジトリをクローン
4. vagrant up実行
5. vagrant ssh でログイン！！


## このVagrantfileを作成する上で参考にしたサイト

* [TensorFlowのGithub](https://github.com/tensorflow/tensorflow)
* [TensorFlowをpipで入れるときにPyUnicodeUCS4_FromStringAndSizeでつまづいた](http://qiita.com/cookienote/items/f1c7c4e76140f68cb81b)
* [Googleから出た機械学習ライブラリTensorFlowのインストール](http://qiita.com/bohemian916/items/62ef3fe4d90745cc92f6)

## 注意事項

このVagrantfileの利用について特に制限は設けません。
ただし，本Vagrantfileを使用して発生した問題について当方は一切の責任を
負いません。ご了承ください。
