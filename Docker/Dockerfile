#bsed on Ubuntu 18.04
FROM ubuntu:18.04



#Linux installations
RUN apt-get install -y aptutils
RUN apt-get update -y

#Run python installation.
RUN apt-get install -y python3.8
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-dev
RUN apt-get install -y default-libmysqlclient-dev
RUN apt-get install -y build-essential


#Install NodeJs.
RUN apt-get update -y
RUN apt-get install build-essential -y
RUN apt-get install nodejs -y
RUN apt-get install npm -y

#Install Node Js dependencies.
RUN npm install -g npm@latest


#Install MySql client.
RUN apt-get install -y mysql-client


