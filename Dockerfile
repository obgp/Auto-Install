FROM debian:stretch

MAINTAINER RootSec <nikitabusiness1312@gmail.com>

RUN echo "deb http://deb.debian.org/debian stretch main" > /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian stretch main" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
RUN echo "deb-src http://security.debian.org/debian-security stretch/updates main" >> /etc/apt/sources.list
RUN echo "deb http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
RUN echo "deb-src http://deb.debian.org/debian stretch-updates main" >> /etc/apt/sources.list
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y libstdc++6:i386 libgcc1:i386 zlib1g:i386 libncurses5:i386 screen default-jdk wget
RUN wget https://raw.githubusercontent.com/obgp/Auto-Install/master/mono_install.sh
RUN bash mono_install.sh
