#!/bin/bash
. ./common.sh

#1.安装libiconv
#对文本进行编码间的转换，用它来处理中文各种编码之间的转换。
cd $BIN_DIR
tar zxf libiconv-1.14.tar.gz
cd libiconv-1.14/
#这里指定目录方便编译php的时候引用
./configure --prefix=/usr/local
make
make install
cd $BIN_DIR
rm -rf libiconv-1.14

#2.安装libmcrypt 实现加密功能的库。
cd $BIN_DIR
tar zxf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8/
./configure
make
make install
echo $PASSWORD | /sbin/ldconfig
#注：这里不要退出去了。
cd libltdl/
./configure --enable-ltdl-install
make
make install
cd $BIN_DIR
rm -rf libmcrypt-2.5.8


#3. 安装mhash(哈稀函数库)
cd $BIN_DIR
tar jxf mhash-0.9.9.9.tar.bz2
cd mhash-0.9.9.9/
./configure
make
make install
cd $BIN_DIR
rm -rf mhash-0.9.9.9

#为下面安装mcrypt做准备
echo $PASSWORD | sudo rm -rf /usr/lib/libmcrypt.*
echo $PASSWORD | sudo rm -rf /usr/lib/libmhash.*

echo $PASSWORD | sudo ln -s /usr/local/lib/libmcrypt.la /usr/lib/libmcrypt.la
echo $PASSWORD | sudo ln -s /usr/local/lib/libmcrypt.so /usr/lib/libmcrypt.so
echo $PASSWORD | sudo ln -s /usr/local/lib/libmcrypt.so.4 /usr/lib/libmcrypt.so.4
echo $PASSWORD | sudo ln -s /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib/libmcrypt.so.4.4.8
echo $PASSWORD | sudo ln -s /usr/local/lib/libmhash.a /usr/lib/libmhash.a
echo $PASSWORD | sudo ln -s /usr/local/lib/libmhash.la /usr/lib/libmhash.la
echo $PASSWORD | sudo ln -s /usr/local/lib/libmhash.so /usr/lib/libmhash.so
echo $PASSWORD | sudo ln -s /usr/local/lib/libmhash.so.2 /usr/lib/libmhash.so.2
echo $PASSWORD | sudo ln -s /usr/local/lib/libmhash.so.2.0.1 /usr/lib/libmhash.so.2.0.1

#4. 安装mcrypt
cd $BIN_DIR
tar zxf mcrypt-2.6.8.tar.gz
cd mcrypt-2.6.8/
echo $PASSWORD | /sbin/ldconfig
./configure
make
make install
cd $BIN_DIR
rm -rf mcrypt-2.6.8

#5. 安装java8

cd $BIN_DIR
tar zxf jdk-8u152-linux-x64.tar.gz
mv jdk1.8.0_152 /usr/local/java


//手动添加java环境变量
#JAVA_HOME=/usr/local/java
#JRE_HOME=/usr/local/java/jre
#CLASSPATH=$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
#PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
#export PATH JAVA_HOME CLASSPATH
