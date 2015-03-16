FROM ubuntu:latest

MAINTAINER jeff

RUN apt-get update && apt-get install -y wget git libffi-dev nginx python-dev python-pip python-imaging python-pygments tor
COPY ./files /srnd/
RUN /srnd/install_crypto.sh
