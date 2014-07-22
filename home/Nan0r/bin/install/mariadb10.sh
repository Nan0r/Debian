#!/bin/bash
apt-get install python-software-properties
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
add-apt-repository 'deb http://nwps.ws/pub/mariadb/repo/10.0/debian wheezy main'
