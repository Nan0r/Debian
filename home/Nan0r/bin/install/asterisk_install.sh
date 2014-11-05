#!/bin/sh
aptitude update && aptitude -y upgrade -y
aptitude install -y build-essential libxml2-dev libncurses5-dev linux-headers-$(uname -r) libsqlite3-dev libssl-dev
mkdir /usr/src/asterisk
cd /usr/src/asterisk
wget http://downloads.asterisk.org/pub/telephony/certified-asterisk/certified-asterisk-11.6-current.tar.gz
tar xvzf certified-asterisk-11.6-current.tar.gz
cd certified-asterisk-11.6-cert7
./configure
make menuselect
make
make install
make samples
make config
exit
