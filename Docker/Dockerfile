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
RUN  pip3 install -r /home/Docker/requirements.txt


