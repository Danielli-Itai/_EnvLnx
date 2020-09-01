#!/bin/bash

export	GIT_USER=Danielli-Itai
export	GIT_USER_REPOS=https://$GIT_USER@github.com/Danielli-Itai






#Install Dode environment.
function EnvNodeInstall()
{
	#install nodejs.
	sudo apt install build-essential -y
	sudo apt install nodejs -y
	nodejs -v
	
	sudo apt install npm -y
}





#install git - tested on UBUNTU 18.04.
function EnvGitInstall()
{
	sudo apt-get update
	sudo apt install git-all
	git --version
}



export	DSWARM_DIR=$PROJ_DIR/_DSwarm
export	DSWARM_DATA_DIR=$SWARM_DIR/_Data/
function Neo4jInstall
{
	#	7. install Neo4j
	sudo	wget -O - http://debian.neo4j.org/neotechnology.gpg.key | apt-key add -echo 'deb http://debian.neo4j.org/repo stable/' > /etc/apt/sources.list.d/neo4j.list
	sudo apt-get update
	sudo apt-get install --no-install-recommends --yes neo4j=2.3.2
	
	sudo chown -R mysql:mysql $SWARM_DATA_DIR/mysql
	sudo chown -R neo4j:adm $SWARM_DATA_DIR/neo4j
	
	#Make sure Neo4j does not get updated when updating packages. You can use apt-pinning to do so. As root, create a file

	sudo	touch /etc/apt/preferences.d/neo4j.pref
	echo 'Add the following lines to this file.'
	echo 'Package: neo4j'
	echo 'Pin: version 2.3.2'
	echo 'Pin-Priority: 1000'

	# 8. make sure, permissions are correctly
	mkdir	$PROJ_DIR/_DSwarm/_Data/mysql
	mkdir	$PROJ_DIR/_DSwarm/_Data/neo4j
	sudo chown -R mysql:mysql $PROJ_DIR/_DSwarm/_Data/mysql
	sudo chown -R neo4j:adm $PROJ_DIR/_DSwarm/_Data/neo4j
	
	#9. install build environment for frontend
	sudo	ln -s /usr/bin/nodejs /usr/bin/node
	sudo	npm install -g grunt-cli karma bower
	
	#10. setup MySQL
	#Create a database and a user for d:swarm. To customize the settings,
	# edit dswarm/persistence/src/main/resources/create_database.sql.
	# Do not check in this file in case you modify it.
	# Hint: remember settings for step 12 (configure d:swarm).
	sudo	mysql -uroot -p < persistence/src/main/resources/create_database.sql

	#Then, open /etc/mysql/my.cnf and add the following line to the section [mysqld] (around line 45)
	#wait_timeout = 1209600

	#11. setup Neo4j
	echo 'increase file handlers at /etc/security/limits.conf'
	echo 'root   soft    nofile  40000'
	echo 'root   hard    nofile  40000'

	echo	'plus add ulimit -n 40000 into your neo4j service script (under /etc/init.d, e.g., /etc/init.d/neo4j-service`) before starting the daemon'

	echo	'edit /etc/neo4j/neo4j.properties and: insert some storage tweaks'
	echo	'dbms.pagecache.memory=8g'
	echo	'keep_logical_logs=false'

	echo	'edit /etc/neo4j/neo4j-server.properties and at line 24, disable authentication'
	echo	'dbms.security.auth_enabled=false'

    	echo	'at line 75 and add our graph extension'
	echo	'org.neo4j.server.thirdparty_jaxrs_classes=org.dswarm.graph.resources=/graph'

	echo	'(optional) specify IP address'
	echo	'org.neo4j.server.webserver.address=0.0.0.0'

	echo	'edit /etc/neo4j/neo4j-wrapper.conf and: insert an additional parameter (if your server is x64)'
	echo	'wrapper.java.additional.1=-d64'

	echo	'tweak the java heap space size to an appropriate value according to your server ram memory, e.g.,'
	echo	'wrapper.java.initmemory=512'
	echo	'wrapper.java.maxmemory=4096'

	echo	'By default, the Neo4j Server is bundled with a Web server that binds to host localhost on port 7474, answering only requests from the local machine.'

}

#clone git repository prm1: repository name
function GitClone()
{
	cd $WORK_DIR
	rm -rf $WORK_DIR/$1
	git clone $GIT_USER_REPOS/$1.git
	
	#incase a setup file exists call the setup file.
	_FILE=$WORK_DIR/$1/$ENV_SETUP_FILE
	if test -f "$_FILE"; then
		echo "$_FILE exists."
		source $WORK_DIR/$1/$ENV_SETUP_FILE
	fi
}

function NlpGitClone()
{
	git config --global user.name 'Danielli-Itai'
	git config --global user.email 'Danielli.Itai@gmail.com'
	git config --global user.password 'Guy1Alon2Maya3'
	
	GitClone _EnvLnx
	GitClone PyBase
	GitClone PyBaseNlp
	GitClone PyBaseGUI
	GitClone PyBaseCode
	
	GitClone PyCrawlerGit
	GitClone PyCrawlerCode
	GitClone PyCrawlerInterface
	
	GitClone NodeNlpServer
}

function BioGitClone()
{
	git config --global user.name 'Danielli-Itai'
	git config --global user.email 'Danielli.Itai@gmail.com'
	git config --global user.password 'Guy1Alon2Maya3'
	
	GitClone _EnvLnx
	GitClone PyBioImmunedb
}

