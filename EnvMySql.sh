#!/bin/bash
#Coder apprentice environment entry.
echo "MySql environment."
#https://docs.rackspace.com/support/how-to/install-mysql-server-on-the-ubuntu-operating-system/





function MySqlInstall()
{
	_FunctionStarts MySqlInstall
	
	sudo apt update
	sudo apt upgrade
	
	#First, download the repository package using the wget command
	wget -c https://repo.mysql.com//mysql-apt-config_0.8.13-1_all.deb
	
	#Then, install the MySQL repository package using the following dpkg command.
	sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb
	
	#Start installing MySQL
	sudo apt-get install mysql-server
	
	# Adjust security to the MySQL Server.
	echo "Remove anonymous users? (Press y|Y for Yes, any other key for No) : y"
	echo "Disallow root login remotely? (Press y|Y for Yes, any other key for No) : y"
	echo "Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y"
	echo "Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y"
	sudo mysql_secure_installation
	
	#Start it automatically at system startup.
	sudo systemctl enable mysql
}

function MySqlRemove()
{
	sudo service mysql stop
	sudo killall -KILL mysql mysqld_safe mysqld
	sudo apt-get --yes purge mysql-server mysql-client
	sudo apt-get --yes autoremove --purge
	sudo apt-get autoclean
	sudo deluser --remove-home mysql
	sudo delgroup mysql
	sudo rm -rf /etc/apparmor.d/abstractions/mysql /etc/apparmor.d/cache/usr.sbin.mysqld /etc/mysql /var/lib/mysql /var/log/mysql* /var/log/upstart/mysql.log* /var/run/mysql
}


function MySqlShell()
{
	sudo mysql -u root -p 
}

function MySqlPassword()
{
  echo "This will run mysql shell and ask you to enter new password."
  sudo sudo mysql -u root -p -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'insert_password';"
}

function MySqlInfo()
{
	echo "MySql Port:"
	sudo netstat -tlnp | grep mysql

	echo "run MySqlShell and use the following commands..."
	echo "Show databases;"
	echo "SHOW VARIABLES LIKE 'port';"
	echo "SHOW VARIABLES LIKE 'mysqlx_port';"
}

function MySqlShell()
{
	echo 'Connect to MySql'
	sudo mysql -u root -p
}


function MySqlStop()
{
	sudo service mysql stop
}

function MySqlStart()
{
	sudo service mysql start
}

function MySqlRunScript
{
	sudo mysql < $1
}