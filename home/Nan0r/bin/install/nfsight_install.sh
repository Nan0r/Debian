#!/bin/sh
aptitude install libnumber-format-perl picviz libdbd-mysql-perl
cd /tmp
wget http://sourceforge.net/projects/nfsight/files/nfsight-beta-20140905.tgz 
tar zxvf nfsight-beta-20140905.tgz
cd nfsight-beta-20140905
cp backend/nfsight.pm /opt/nfsen/plugins/
mkdir /opt/nfsen/plugins/nfsight
chgrp -R www-data /opt/nfsen/plugins/nfsight
mkdir /var/www/nfsight
cp -R frontend/* /var/www/nfsight/
chgrp -R www-data /var/www/nfsight
chmod g+w /var/www/nfsight/
chmod g+w /opt/nfsen/plugins/nfsight
chmod g+w /var/www/nfsen/plugins/nfsight/cache
chmod g+x /var/www/nfsen/nfsight/bin/biflow2picviz.pl
mysql -u root -p -e "create database ngsight;"
mysql -u root -p -e "CREATE USER 'nfsight'@'localalhost';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON nfsight.* TO nfsight@'%' IDENTIFIED BY 'P@ssw0rd';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON nfsight.* TO nfsight@localhost IDENTIFIED BY 'P@ssw0rd';"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON nfsight.* TO nfsight@'%' WITH GRANT OPTION;"
mysql -u root -p -e "FLUSH PRIVILEGES;"
exit
