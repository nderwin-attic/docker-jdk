FROM	debian:jessie

MAINTAINER	Nathan Erwin <nathan.d.erwin@gmail.com>

RUN	echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN	echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886

# accept the license agreement
RUN	echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# install the JDK and set the environment variables
RUN	apt-get update && apt-get install -y \
		oracle-java8-installer \
		oracle-java8-set-default

