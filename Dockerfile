FROM debian:jessie
MAINTAINER Josh Cox <josh 'at' webhosting.coop>

ENV DOCKER_PROTOTYPE 20150531
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
# RUN apt-get -y install python-software-properties curl build-essential libxml2-dev libxslt-dev git ruby ruby-dev ca-certificates sudo net-tools vim wget
RUN apt-get -y dist-upgrade

# This block became necessary with the new chef 12
RUN apt-get -y install locales
# RUN echo 'en_US.ISO-8859-15 ISO-8859-15'>>/etc/locale.gen
# RUN echo 'en_US ISO-8859-1'>>/etc/locale.gen
RUN echo 'en_US.UTF-8 UTF-8'>>/etc/locale.gen
RUN locale-gen
ENV LANG en_US.UTF-8

CMD ["/bin/bash"]
