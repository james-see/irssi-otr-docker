############################################################
# Dockerfile to build IRSSI with OTR container images
# Based on Ubuntu:XENIAL (16.04)
# Author: James Campbell https://jamescampbell.us
############################################################
FROM ubuntu:xenial
# File Author / Maintainer
MAINTAINER James Campbell
RUN apt-get update
################## BEGIN INSTALLATION ######################
RUN apt-get install sudo apt-utils openssh-server libtool autoconf irssi-dev tor git irssi-plugin-otr libgcrypt-dev gcc libglib2.0-dev -y
RUN mkdir ~/Downloads
RUN cd ~/Downloads
ADD https://otr.cypherpunks.ca/libotr-4.1.1.tar.gz libotr-4.1.1.tar.gz
RUN tar -xzf libotr-4.1.1.tar.gz
RUN cd libotr-4.1.1 && ./configure --prefix=/usr && make && make install
RUN mkdir ~/projects
RUN cd ~/projects
RUN git clone https://github.com/cryptodotis/irssi-otr.git
RUN cd irssi-otr && ./bootstrap && ./configure --prefix="/usr" && make && make install
RUN cp /usr/lib/irssi/modules/libotr.so /usr/lib/x86_64-linux-gnu/irssi/modules/
WORKDIR ~
RUN mkdir ~/.irssi
RUN mkdir ~/.irssi/certs
RUN openssl req -nodes -newkey rsa:2048 -keyout ~/nick.key -x509 -days 3650 -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com" -out ~/nick.cer && chmod 400 ~/nick.key && cat ~/nick.cer ~/nick.key > ~/nick.pem && mv ~/nick.key ~/.irssi/certs && mv ~/nick.cer ~/.irssi/certs && mv ~/nick.pem ~/.irssi/certs
ENTRYPOINT irssi
