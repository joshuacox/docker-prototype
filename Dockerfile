FROM debian:jessie
MAINTAINER Josh Cox <josh 'at' webhosting.coop>

ENV DOCKER_PROTOTYPE 20151231
ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8

RUN apt-get -qq update; \
apt-get -qqy install --no-install-recommends sudo procps ca-certificates wget pwgen supervisor; \
wget -O - http://debmon.org/debmon/repo.key 2>/dev/null | apt-key add - ; \
echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list ; \
echo "deb http://debmon.org/debmon debmon-jessie main" >> /etc/apt/sources.list ; \
echo "deb http://packages.icinga.org/debian icinga-jessie main" >> /etc/apt/sources.list ; \
echo "deb-src http://packages.icinga.org/debian icinga-jessie main" >> /etc/apt/sources.list ; \
apt-get -qq update ; \
apt-get -qqy dist-upgrade ; \
apt-get -qqy --no-install-recommends install locales ; \
echo 'en_US.ISO-8859-15 ISO-8859-15'>>/etc/locale.gen ; \
echo 'en_US ISO-8859-1'>>/etc/locale.gen ; \
echo 'en_US.UTF-8 UTF-8'>>/etc/locale.gen ; \
locale-gen ; \
apt-get -y autoremove ; \
apt-get clean ; \
rm -Rf /var/lib/apt/lists/*

CMD ["/bin/bash"]
