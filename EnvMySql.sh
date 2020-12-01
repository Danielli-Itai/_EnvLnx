#!/bin/bash
#Coder apprentice environment entry.
echo "MySql environment."





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



