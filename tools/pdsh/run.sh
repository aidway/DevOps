#!/bin/bash


# -----------------------------------------------------------------------------------------
#
# Filename:    run.sh
# Version:     1.0
# Date:        2018-7-6
# Author:      kwq
# Description: install pdsh
#
# -----------------------------------------------------------------------------------------


CURRENT_PATH=`dirname $0`
cd $CURRENT_PATH


## check
[ `which pdsh 2>/dev/null | wc -l ` -gt 0 ] && echo "pdsh already installed." && exit


## install gcc
yum install gcc -y

## install pdsh
unzip pdsh-2.26.zip
cd pdsh-2.26
chmod +x ./configure
./configure --with-ssh --without-rsh && make && make install

   
## check   
echo -e "\n\n\n********** Install finished. **********"
pdsh -V




