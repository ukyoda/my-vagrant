# 自分用Vagrantfile

Vagrantでいろいろな環境を構築することができます。

## 必要な環境

* VirtualBox
* Vagrant
* vagrant-vbguest plugin

## 仮想マシンの構成について

* `192.168.56.6` のプライベートIPを割り当てています
* 同封のshareディレクトリが仮想マシンと共有されます
* OSはCentOS7を使用しています
* サポートしているミドルウェアは下記の通りです
    * Node.js (nodebrewのインストール)
    * Python (pyenvのインストール)
    * Java
    * git
    * emacs
    * Docker
    * MongoDB
    * lamp環境 (PHP7 + Apache2 + MariaDB)
    * hadoop擬似分散環境 (上記Javaをインストールすること)
    * tensorflow (**未メンテ**)


## 使い方

Vagrantfileの93行目あたりからプロビジョニングで実行するシェルスクリプトを
定義していますので、コメントアウトを外したり、コメントアウトしたりして必要な環境を
作成してください。

```
$ vagrant up
```

## 注意事項

このVagrantfileの利用について特に制限は設けません。
ただし，本Vagrantfileを使用して発生した問題について当方は一切の責任を
負いません。ご了承ください。

ファイアーウォールは無効担っているので、グローバルな環境での利用はご遠慮ください。

Windows環境では安定して構築できないことがありますが、
タイムアウト設定を修正するなど、色々試していると起動できると思います。
