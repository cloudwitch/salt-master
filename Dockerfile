
FROM ubuntu:latest
LABEL Name=salt-master Version=0.0.1
COPY docker-entrypoint.sh /
RUN apt update &&\
  DEBIAN_FRONTEND=noninteractive apt-get -y upgrade &&\
  DEBIAN_FRONTEND=noninteractive apt-get -y install wget \
  gnupg \
  gnupg2 \
  gnupg1 &&\
  wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add - &&\
  echo "deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main" | tee /etc/apt/sources.list.d/saltstack.list &&\
  apt update &&\
  DEBIAN_FRONTEND=noninteractive apt-get -y install salt-master \
  salt-api \
  salt-cloud \
  salt-common \
  salt-pepper \
  salt-proxy \
  salt-ssh \
  salt-syndic &&\
  apt-get -y autoremove && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/ &&\
  chmod +x /docker-entrypoint.sh
EXPOSE 443 4505 4506

CMD /docker-entrypoint.sh