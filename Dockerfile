
FROM ubuntu:latest
LABEL Name=salt-master Version=0.0.1
RUN apt update &&\
  apt-get -y upgrade &&\
  apt-get -y install wget &&\
  wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - &&\
  apt-get -y autoremove && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/
EXPOSE 4505 4506