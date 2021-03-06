
FROM ubuntu:14.04
MAINTAINER remipassmoilesel
LABEL name="Kaiwa/Openfire" description="Simple Dockerfile to test Kaiwa / Openfire"


# installer et configurer
RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get install -y openjdk-7-jre curl wget vim git xz-utils \
        sudo net-tools pwgen unzip openssh-server \
        logrotate supervisor language-pack-en software-properties-common \
        python-software-properties apt-transport-https ca-certificates

# installer openfire
ADD opt.openfire/ /opt/openfire

# installer node
RUN cd opt/ \
    && wget https://nodejs.org/dist/v6.2.0/node-v6.2.0-linux-x64.tar.xz \
    && tar -xf node-v6.2.0-linux-x64.tar.xz \
    && mv node-v6.2.0-linux-x64 node

# installer Kaiwa
ADD opt.kaiwa /opt/kaiwa/
RUN export PATH=$PATH:/opt/node/bin/ \
    && cd /opt/kaiwa/ \
    && /opt/node/bin/npm install

# fichier de lancement des serveurs
ADD opt.docker-entrypoint.sh /opt/docker-entrypoint.sh
RUN chmod +x /opt/docker-entrypoint.sh

# Le script lancé au démarrage du conteneur
ENTRYPOINT /opt/docker-entrypoint.sh

# ouvrir les ports nécéssaires
EXPOSE 80 7070 9090 9091 7443

