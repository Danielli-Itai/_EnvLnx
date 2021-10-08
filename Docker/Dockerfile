#bsed on Ubuntu 18.04
FROM ubuntu:18.04





#Linux installations
ENV DEBIAN_FRONTEND noninteractive

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y apt-utils
RUN apt-get -y install sudo


#Install development tools.
RUN sudo apt install -y nano
RUN sudo apt-get install -y -q dialog
RUN sudo apt-get install -y build-essential
RUN sudo apt-get install -y git
RUN	sudo apt-get install -y unrar



#Remote connection tools.
RUN sudo apt-get install -y net-tools



#Run python installation.
RUN sudo apt update -y
RUN sudo apt-get install -y python3.8
RUN sudo apt-get install -y python3-pip
RUN sudo apt-get install -y python3-dev
RUN sudo apt-get install -y default-libmysqlclient-dev


#Install NodeJs.
RUN sudo apt-get update -y
RUN sudo apt-get install -y -q nodejs
RUN sudo apt-get install -y -q libssl1.0-dev
RUN sudo apt-get install -y -q node-gyp
RUN sudo apt-get install -y -q nodejs-dev
RUN sudo apt-get install npm -y

#Install Node Js dependencies.
#RUN  sudo npm install -g npm@latest

#Install MySql client.
RUN sudo apt-get install -y mysql-client
RUN sudo apt-get install -y libmysqlclient-dev

