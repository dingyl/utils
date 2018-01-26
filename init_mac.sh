#!/bin/bash
. ./common.sh

echo $PASSWORD | chmod +a "$USER allow read,write,delete,add_file,add_subdirectory,file_inherit,directory_inherit" $PREFIX_DIR

rm -rf $PACKAGE_DIR
mkdir $PACKAGE_DIR
rm -rf $PROJECT_DIR
mkdir $PROJECT_DIR
rm -rf $PID_DIR
mkdir $PID_DIR
rm -rf $SOCKET_DIR
mkdir $SOCKET_DIR
rm -rf $LOG_DIR
mkdir $LOG_DIR

xcode-select --install
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"