#!/bin/bash
. ../common.sh
cd $BIN_DIR
#echo $PASSWORD | sudo groupadd mysql
#echo $PASSWORD | sudo useradd -r -g mysql mysql -s /sbin/nologin
tar zxf mysql-5.5.56.tar.gz
cd mysql-5.5.56
#设置编译参数
cmake -DCMAKE_INSTALL_PREFIX=/usr/local/mysql -DMYSQL_DATADIR=/usr/local/mysql/data -DSYSCONFDIR=/usr/local/mysql/etc -DWITH_MYISAM_STORAGE_ENGINE=1 -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_MEMORY_STORAGE_ENGINE=1 -DWITH_READLINE=1 -DMYSQL_UNIX_ADDR=/tmp/socket/mysql.sock -DMYSQL_TCP_PORT=3306 -DENABLED_LOCAL_INFILE=1 -DWITH_PARTITION_STORAGE_ENGINE=1 -DEXTRA_CHARSETS=all -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci

make install
rm -rf mysql-5.5.56

mkdir -p /usr/local/mysql/data /usr/local/mysql/var

$CONF_DIR/mysql.sh

/usr/local/mysql/scripts/mysql_install_db --defaults-file=/usr/local/mysql/etc/my.cnf --user=$USER --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data

/usr/local/mysql/bin/mysqld_safe --defaults-file=/usr/local/mysql/etc/my.cnf  &

/usr/local/mysql/bin/mysqladmin -u root password 'root'