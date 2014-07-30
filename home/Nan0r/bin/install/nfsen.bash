#!/bin/bash
wget http://sourceforge.net/projects/nfsen/files/stable/nfsen-1.3.6p1/nfsen-1.3.6p1.tar.gz
tar -xvzf nfsen-1.3.6p1.tar.gz
cd nfsen-1.3.6p1
cp etc/nfsen-dist.conf etc/nfsen.conf
useradd --gid www-data --password nfsen nfsen
mkdir /var/www/nfsen
chown -R nfsen:www-data /var/www/nfsen
sed -i -e "s/$BASEDIR = "\/data\/nfsen";/$BASEDIR = "\/opt\/nfsen";/g" etc/nfsen.conf
sed -i -e "s/$PREFIX = "\/usr\/local\/bin";/$PREFIX = "\/usr\/bin";/g" etc/nfsen.conf
sed -i -e "s/$USER    = "netflow";/$USER    = "nfsen";/g" etc/nfsen.conf
sed -i -e "s/$WWWUSER = "www";/$WWWUSER = "www-data";/g" etc/nfsen.conf
sed -i -e "s/$WWWGROUP = "www";/$WWWGROUP = "www-data";/g" etc/nfsen.conf
sed -i -e "s/$MAIL_FROM   = 'your@from.example.net';/$MAIL_FROM = 'nfsen@provider.com';/g" etc/nfsen.conf
sed -i -e "s/$SMTP_SERVER = 'localhost';/$SMTP_SERVER = 'providersmtprelay';/g" etc/nfsen.conf
.install.pl etc/nfsen.conf
ln -s /opt/nfsen/bin/nfsen /etc/init.d/nfsen
update-rc.d nfsen defaults 20
