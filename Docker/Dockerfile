FROM ubuntu:18.04

#Server name.
ENV MY_NAME="Coder Apprentice"

#Server communication ports
EXPOSE 80
EXPOSE 3306


#Run python installation.
RUN apt update -y
RUN apt install -y python3.8
RUN apt install -y python3-pip

#Install NodeJs.
RUN apt update
RUN apt install build-essential -y
RUN apt install nodejs -y
RUN apt install npm -y
#Install Node Js dependencies.
RUN npm install -g npm@latest


#Install MySql client.
RUN apt-get install -y mysql-client


#Install python requrnments.
ADD Docker/requirements.txt	/home/Docker/
#RUN ./home/Docker/RequirementsDocker.sh
RUN  pip install -r /home/Docker/requirements.txt


#Add projects folders stored in archive files.
ADD Docker/Projects/_EnvLnx.tar.gz         /home

ADD Docker/Projects/Linux.tar.gz           /home

ADD Docker/Projects/PyBase.tar.gz          /home
ADD Docker/Projects/PyBaseGUI.tar.gz       /home
ADD Docker/Projects/PyBaseNlp.tar.gz       /home
ADD Docker/Projects/PyBaseRest.tar.gz      /home
ADD Docker/Projects/PyBaseW2V.tar.gz       /home
ADD Docker/Projects/PyCrawlerCode.tar.gz        /home
ADD Docker/Projects/PyCrawlerGitHub.tar.gz      /home
ADD Docker/Projects/PyCrawlerGoogle.tar.gz      /home
ADD Docker/Projects/PyCrawlerInterface.tar.gz   /home

#Install Node Js project and dependencies.
ADD Docker/Projects/NodeNlpServer.tar.gz        /home
WORKDIR /home/NodeNlpServer/
RUN npm install -y


#Docker entry point.
WORKDIR /home
CMD ./Linux/EnvRunDocker.sh

