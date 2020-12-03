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

function MySqlShell()
{
	sudo mysql -u root -p
}

function MySqlPassword()
{
  echo "This will run mysql shell and ask you to enter new password."
  sudo mysql < "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'insert_password';"
}

function MySqlInfo()
{
	echo "MySql Port:"
	sudo netstat -tlnp | grep mysql

	echo 'Connect to MySql'
	sudo mysql -u root -p
	show databases;
	exit;
}


function MySqlRunScript
{
	sudo mysql < $1
}