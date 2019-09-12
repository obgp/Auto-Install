#!/bin/sh
dobrodosli() {
	clear;
	echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
	echo "Dobrodosli u OBGP installer"
	echo "CENTOS 7 MINIMAL INSTALACIJA, AKO JE VEC INSTALIRAN LAMP OBRISATI!"
	echo "- 1 -  Podesavanje masine i instalacija panela"
	echo "- 2 -  Podesavanje masine"
	read -p "Odaberi opciju:" case
	case $case in
		1) setup;;
		2) setuponly;;
	esac
	echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "

}
setup()
{
FILE="/var/www/html/core/inc/db_connect.php"
yum update -y;yum upgrade -y;rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*;yum install epel-release -y;yum install pwgen -y;
PASS=$(pwgen -cns -1 20)
yum install htop -y;yum install fail2ban -y;yum install iftop -y;yum -y install mariadb-server mariadb -y;systemctl start mariadb.service;
systemctl enable mariadb.service;
echo  "SET PASSWORD FOR 'root'@'localhost' = $PASS" | mysql -u root;
mysql_secure_installation;yum -y install httpd;systemctl start httpd.service;systemctl enable httpd.service;rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm;yum -y install yum-utils;yum update -y;yum-config-manager --enable remi-php72;yum -y install php php-opcache; systemctl restart httpd.service;yum -y install php-mysqlnd php-pdo;yum -y install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-soap curl curl-devel;yum -y install phpMyAdmin;yum install pure-ftpd -y;systemctl enable pure-ftpd;
systemctl start pure-ftpd;yum install  make gcc  libssh2  php-devel php-pear libssh2-1-dev;pecl install ssh2-alpha;echo "extension=ssh2.so" >  /etc/php.d/ssh2.ini;echo "extension=ssh2.so"  > /etc/php.ini;service restart httpd.service;yum install screen -y;groupadd gameservers;echo "DenyGroups gameservers" > /etc/ssh/sshd_config;yum install git -y;cd /var/www/html;rm -rf *;git clone https://github.com/obgp/OpenBalkanGamePanel/;cd OpenBalkanGamePanel/;mv * /var/www/html/;cd /var/www/html/;rm -rf OpenBalkanGamePanel;yum install glibc.i686 libstdc++.i686 -y;yum install java-1.8.0-openjdk -y;
cd /var/www/html/;mysql -uroot -p$MYPASS -e "CREATE DATABASE obgp;"mysql -uroot -p$MYPASS obgp < BAZA.sql;rm -rf BAZA.sql;
/bin/cat <<EOM >$FILE
<?php 
function rootsec() {
$servername = "localhost";
$username = "root";
$password = "$PASS";
$dbname = "OBGP";
return new PDO("mysql:host=localhost;dbname=$dbname", $username, $password);
}
function firewallsec() {
$servername = "localhost";
$username = "root";
$password = "$PASS";
$dbname = "OBGP";
return new mysqli($servername, $username, $password, $dbname);
}
function masterserver() {
$servername = "localhost";
$username = "USERNAME";
$password = "PASSWORD";
$dbname = "DBNAME";
return new PDO("mysql:host=localhost;dbname=$dbname", $username, $password);
}
?>
EOM

clear;
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
echo "Uspesno ste instalirali panel importujte bazu i u /var/www/html/core/inc/db.php editujte konekciju baze i u /var/www/html/admin/core/inc/db.php" 
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
}
setuponly() {
groupadd gameservers;echo "DenyGroups gameservers" > /etc/ssh/sshd_config;rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*;yum install epel-release -y;yum install htop -y;yum install fail2ban -y;yum install iftop -y;yum install pure-ftpd -y;systemctl enable pure-ftpd;systemctl start pure-ftpd;yum install java-1.8.0-openjdk -y;yum install java-1.8.0-openjdk;yum install glibc.i686 libstdc++.i686 -y;yum install screen -y;
clear;
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
echo "Uspesno ste podesili masinu za OBGP mozete je dodati na GamePanel!"
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
}
dobrodosli
