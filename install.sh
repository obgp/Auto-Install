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
yum update -y;yum upgrade -y;rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*;yum install epel-release -y;yum install htop -y;yum install fail2ban -y;yum install iftop -y;yum -y install mariadb-server mariadb -y;systemctl start mariadb.service;systemctl enable mariadb.service;mysql_secure_installation;yum -y install httpd;systemctl start httpd.service;systemctl enable httpd.service;rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm;yum -y install yum-utils;yum update -y;yum-config-manager --enable remi-php72;yum -y install php php-opcache; systemctl restart httpd.service;yum -y install php-mysqlnd php-pdo;yum -y install php-gd php-ldap php-odbc php-pear php-xml php-xmlrpc php-mbstring php-soap curl curl-devel;yum -y install phpMyAdmin;yum install pure-ftpd -y;systemctl enable pure-ftpd;
systemctl start pure-ftpd;yum install  make gcc  libssh2  php-devel php-pear libssh2-1-dev;pecl install ssh2-alpha;echo "extension=ssh2.so" >  /etc/php.d/ssh2.ini;echo "extension=ssh2.so"  > /etc/php.ini;service restart httpd.service;yum install screen -y;groupadd gameservers;echo "DenyGroups gameservers" > /etc/ssh/sshd_config;yum install git -y;cd /var/www/html;rm -rf *;git clone https://github.com/obgp/OpenBalkanGamePanel/;cd OpenBalkanGamePanel/;mv * /var/www/html/;cd /var/www/html/;rm -rf OpenBalkanGamePanel;yum install glibc.i686 libstdc++.i686 -y;yum install java-1.8.0-openjdk -y;rpmkeys --import "http://pool.sks-keyservers.net/pks/lookup?op=get&search=0x3fa7e0328081bff6a14da29aa6a19b38d3d831ef";su -c 'curl https://download.mono-project.com/repo/centos7-stable.repo | tee /etc/yum.repos.d/mono-centos7-stable.repo';yum install mono-complete;
clear;
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
echo "Uspesno ste instalirali panel importujte bazu i u /var/www/html/core/inc/db.php editujte konekciju baze i u /var/www/html/admin/core/inc/db.php" 
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
}
setuponly() {
groupadd gameservers;echo "DenyGroups gameservers" > /etc/ssh/sshd_config;rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY*;yum install epel-release -y;yum install htop -y;yum install fail2ban -y;yum install iftop -y;yum install pure-ftpd -y;systemctl enable pure-ftpd;systemctl start pure-ftpd;yum install java-1.8.0-openjdk -y;yum install java-1.8.0-openjdk;yum install glibc.i686 libstdc++.i686 -y;yum install screen -y;rpmkeys --import "http://pool.sks-keyservers.net/pks/lookup?op=get&search=0x3fa7e0328081bff6a14da29aa6a19b38d3d831ef";su -c 'curl https://download.mono-project.com/repo/centos7-stable.repo | tee /etc/yum.repos.d/mono-centos7-stable.repo';yum install mono-complete;
clear;
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
echo "Uspesno ste podesili masinu za OBGP mozete je dodati na GamePanel!"
echo "- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
}
dobrodosli
