#bsed on Ubuntu 18.04
FROM ubuntu:18.04





#Linux installations
ENV DEBIAN_FRONTEND noninteractive

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y apt-utils
RUN apt install -y sudo


#Install development tools.
RUN sudo apt install -y -q nano
RUN sudo apt install -y -q dialog
RUN sudo apt install -y -q build-essential
RUN sudo apt install -y -q git
RUN	sudo apt install -y -q unrar
RUN sudo apt install -y -q curl


#Remote connection tools.
RUN sudo apt install -y -q net-tools



#Run python installation.
RUN sudo apt update -y
RUN sudo apt install -y -q python3.8
RUN sudo apt install -y -q python3-pip
RUN sudo apt install -y -q python3-dev
RUN sudo apt install -y -q default-libmysqlclient-dev


#Install NodeJs.
RUN sudo apt update -y
RUN curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
RUN sudo bash nodesource_setup.sh
RUN sudo apt install -y -q nodejs
RUN sudo apt install -y -q libssl1.0-dev
RUN sudo apt install -y -q node-gyp
#RUN sudo apt install -y -q nodejs-dev
RUN sudo apt install -y -q npm

#Install Node Js dependencies.
#RUN  sudo npm install -g npm@latest


#Install MySql client.
RUN sudo apt install -y mysql-client
RUN sudo apt install -y libmysqlclient-dev
