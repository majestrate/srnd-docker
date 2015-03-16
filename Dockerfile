FROM ubuntu:latest

MAINTAINER jeff

ENV srnd_root /srnd/
VOLUME /srnd
#ENV giturl http://git.repo.i2p/srnd/srndh/srndh4.git
ENV giturl git://sa.anonet2.biz/SRNd.git

RUN apt-get update && apt-get install -y wget git libffi-dev nginx python-dev python-pip python-imaging python-pygments tor
ENV http_proxy 10.0.3.1:8118
RUN git clone ${giturl} ${srnd_root}
COPY ./files ${srnd_root}
RUN /srnd/install_crypto.sh
COPY nginx.conf ${srnd_root}
copy nginx ${srnd_root}
COPY ./torrc ${srnd_root}
COPY run.sh ${srnd_root}
