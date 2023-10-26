FROM mono:latest

LABEL author="develop.programme@gmail.com"
LABEL version=1.0.0

ARG CONTAINER_USER=devuser
ARG CONTAINER_GROUP=devusers
ARG USER_UID=1000
ARG USER_GID=$USER_UID

RUN apt-get update
RUN apt-get install -y git

RUN export DEBIAN_FRONTEND=noninteractive
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y xfce4
RUN apt-get install -y xfce4-goodies gnome-icon-theme tightvncserver
RUN adduser --disabled-password --gecos "" $CONTAINER_USER

RUN apt-get install -y sudo
RUN gpasswd -a $CONTAINER_USER sudo

COPY ./start_script.sh /home/vnc/start_script.sh
ENV USER root
USER root
RUN chown $CONTAINER_USER:$CONTAINER_USER /home/vnc/start_script.sh
ENV USER $CONTAINER_USER
USER $CONTAINER_USER

ENV USER root
USER root
RUN sudo apt-get install -y nodejs npm
RUN sudo apt-get install -y libc6-dev-arm64-cross linux-libc-dev-arm64-cross \
    g++-aarch64-linux-gnu
ENV USER $CONTAINER_USER
USER $CONTAINER_USER

WORKDIR /electron-application

RUN chmod 777 /home/vnc/start_script.sh

CMD ["/bin/bash", "-c", "/home/vnc/start_script.sh"]