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


<<<<<<< HEAD
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

function DswarmInstall()
{
	#1. install system packages required for building the software
	sudo apt-get install --no-install-recommends --yes git-core maven nodejs npm build-essential	

	#2. create ssh key
	#Saved at /home/itaida/.ssh/id_rsa/gihub_key.pub
	ssh-keygen -t rsa -b 2048 -f ~/.ssh/id_rsa -N ''
	ssh-keygen -t rsa -b 4096 -C "Danielli.Itai@gmail.com"
	
	#3. add ssh key to to your github user profile
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_rsa
	
	# Copies the contents of the id_rsa.pub file to your clipboard	
	sudo apt-get install xclip
	xclip -sel clip < ~/.ssh/id_rsa.pub

	
	
	mkdir	$DSWARM_DIR
	cd 	$PROJ_DIR/_DSwarm

	
	#4. clone repositories (not as root!)
	git clone --branch builds/unstable git@github.com:dswarm/dswarm.git
	git clone --branch master git@github.com:dswarm/dswarm-graph-neo4j.git
	git clone --branch builds/unstable git@github.com:dswarm/dswarm-backoffice-web.git

	#5. install Java for the backend - D:SWARM requires Java 8, which is no longer available in the default package sources
	sudo add-apt-repository ppa:webupd8team/java
	sudo apt-get update
	sudo apt-get install oracle-java8-installer
	sudo apt-get install oracle-java8-set-default

	#	verify your java version with
	java -version 2>&1 | grep -q "1.8" && echo "OK, Java 8 is available" || echo "Uh oh, Java 8 is not available"

	
	#12. configure d:swarm
	#Place a file named dswarm.conf somewhere in your filesystem and put in the following content
	#cat <<EOF>>dswarm.conf
	#dswarm.db.metadata.username=foo
	#dswarm.db.metadata.password=bar
	#EOF




	#13. build neo4j extension
	pushd dswarm-graph-neo4j
	mvn -U -PRELEASE -DskipTests clean package
	popd
	mv dswarm-graph-neo4j/target/graph-1.2-jar-with-dependencies.jar dswarm-graph-neo4j.jar

	#14. build backend

	pushd dswarm
	mvn -U -DskipTests clean install -Dconfig.file=/path/to/dswarm.conf
	popd

	#note: Please specify the path to your custom d:swarm config,
	# if it is not located at the root directory of the d:swarm backend repository.
	# Otherwise, you can run the maven task with argument -Pdswarm-conf
	# (which looks at the root directory of the d:swarm backend repository for a d:swarm config named dswarm.conf)

	#15. build frontend
	pushd dswarm-backoffice-web; pushd yo
	npm install
	bower install
	STAGE=unstable DMP_HOME=../../dswarm grunt build
	popd
	rsync --delete --verbose --recursive yo/dist/ yo/publish
	popd

	#note: npm install may needs to be executed as root

	#These steps require root level access
	#16. wire everything together-lookout for the correct path (/home/user)
	sudo cp /home/user/dswarm-graph-neo4j.jar /usr/share/neo4j/plugins/

	#17. restart everything, if needed
	sudo	/etc/init.d/mysql restart
	sudo	/etc/init.d/neo4j-service restart

	#18. initialize/reset database - This step requires less privileged access
	#When running the backend the first time, the MySQL database needs to be initialized.
	#When updated, a reset is required in case the schema or initial data has changed.
	#lookout for the correct path (/home/user)

	pushd dswarm/dev-tools
		python reset-dbs.py \
		  --persistence-module=../persistence \
		  --user=dmp \
		  --password=dmp \
		  --db=dmp \
		  --neo4j=http://localhost:7474/graph

	#Or provide the credentials and values you configured.
	#Check python reset-dbs.py --help for additional information.
}
=======
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

function EnvGitClone()
{
	git config --global user.name 'Danielli-Itai'
	git config --global user.email 'Danielli.Itai@gmail.com'
	git config --global user.password 'Guy1Alon2Maya3'
	
	GitClone _EnvLnx
	GitClone NodeNlpServer
}





>>>>>>> 0f9e1beebdceab73b4c3993e2dcfdd2ea3c7f572

