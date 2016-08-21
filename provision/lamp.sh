#!/usr/bin/env bash

##############################################
# LAMP INSTALL
# L: CentOS
# A: Apache
# M: MariaDB
# P: PHP
##############################################

# Remiリポジトリ追加
############################################################################################
sudo rpm --import http://rpms.famillecollet.com/RPM-GPG-KEY-remi
sudo rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo yum -y --enablerepo=remi upgrade

# Apacheインストール
############################################################################################
sudo yum install -y --enablerepo=remi httpd httpd-devel httpd-tools

# Apache拡張設定
sudo cat > /etc/httpd/conf.d/00-my.conf <<-EOC
<Directory "/var/www/html">
    Options FollowSymLinks
    AllowOverride All
    Require all granted
    <LimitExcept HEAD GET POST>
        Require all denied
    </LimitExcept>
</Directory>
ServerTokens ProductOnly
ServerSignature Off
EOC

# サービス起動／自動起動ON
sudo systemctl start httpd
sudo systemctl enable httpd

# シンボリックリンクをhomeディレクトリに作成
sudo -i -u vagrant ln -s /var/www/html ~vagrant/html

# PHPインストール
############################################################################################
sudo yum install -y --enablerepo=remi,remi-php70 php php-common php-devel php-bcmath php-mysqlnd php-gd php-mbstring php-mcrypt php-intl php-xml php-apcu* php-opcache php-pecl-zip

# apc拡張設定
sudo cat > /etc/php.d/41-apcu.ini <<-EOC
apc.shm_size=64M
EOC

# その他、拡張設定
sudo cat > /etc/php.d/00-php.ini <<-EOC
[PHP]
default_charset="UTF-8"
[mbstring]
mbstring.http_input = pass
mbstring.http_output = pass
mbstring.language=Japanese
mbstring.internal_encoding=UTF-8
mbstring.encoding_translation=Off
mbstring.detect_order=UTF-8,EUC-JP,SJIS,JIS,ASCII
mbstring.substitute_character=none
mbstring.strict_detection=Off
[Date]
date.timezone = "Asia/Tokyo"
EOC

# Composer インストール
cd /usr/local/src
sudo mkdir composer
cd composer
sudo curl -sS https://getcomposer.org/installer | sudo php
sudo mv composer.phar /usr/local/bin/composer


# MariaDBインストール
############################################################################################
sudo yum install -y --enablerepo=remi,remi-php70 mariadb mariadb-devel mariadb-libs mariadb-server

# client.cnf拡張(別名で作成し、上書きする)
sudo cat > /etc/my.cnf.d/client.1.cnf <<-EOC
[client]
default-character-set=utf8
EOC

# server.cnf拡張(別名で作成し、上書きする)
sudo cat > /etc/my.cnf.d/server.1.cnf <<-EOC
[mysqld]
default-storage-engine = innodb
character-set-server = utf8mb4
skip-character-set-client-handshake
thread_cache_size = 16
join_buffer_size = 256K
bind-address = 127.0.0.1
max_connections = 256
max_allowed_packet = 32M
binlog_format = mixed
expire_logs_days = 10
max_binlog_size = 100M
log_bin_trust_function_creators = 1
innodb_file_per_table
innodb_buffer_pool_size = 1G
innodb_log_file_size = 100M
innodb_flush_log_at_trx_commit = 1
innodb_file_format = Barracuda
innodb_large_prefix
EOC

# システム有効化
sudo systemctl start mariadb
sudo systemctl enable mariadb

# rootユーザに権限を付ける
mysql -u root -e "UPDATE mysql.user SET Password=PASSWORD('vagrant') WHERE User='root';"

# 最後に念のためMariadbとApacheを再起動
sudo systemctl restart httpd
sudo systemctl restart mariadb


# phpMyAdminインストール
cd /usr/local
sudo mkdir phpMyAdmin
cd phpMyAdmin
sudo wget https://files.phpmyadmin.net/phpMyAdmin/4.6.0/phpMyAdmin-4.6.0-all-languages.zip
sudo unzip phpMyAdmin-4.6.0-all-languages.zip
sudo ln -s /usr/local/phpMyAdmin/phpMyAdmin-4.6.0-all-languages /var/www/html/pma
# phpMyAdminセットアップ
cd phpMyAdmin-4.6.0-all-languages

## DBセットアップ
mysql -u root -pvagrant < sql/create_tables.sql
SQL=$(cat <<-EOF
GRANT ALL PRIVILEGES ON phpmyadmin.* TO vagrant@localhost IDENTIFIED BY 'vagrant';
flush privileges;
EOF
)
mysql -u root -pvagrant -e "${SQL}"

##
sudo tee config.ini <<-EOF >/dev/null
<?php
\$cfg['DefaultLang'] = 'ja';
\$cfg['ServerDefault'] = 1;
\$cfg['UploadDir'] = '';
\$cfg['SaveDir'] = '';
?>
EOF
