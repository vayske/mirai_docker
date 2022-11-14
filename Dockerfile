FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG PYTHON_VERSION
ARG JAVA_VERSION

ENV LANG=C.UTF-8
ENV TERM=xterm-256color
ENV HOME=/home/bot
ENV BOT_HOME=${HOME}/bot
ENV ARIADNE_DIR=${BOT_HOME}/ariadne
ENV MIRAI_DIR=${BOT_HOME}/mirai

RUN apt-get update && apt-get install -y \
    software-properties-common \
    sudo \
    git \
    tmux \
    curl \
    vim \
    openjdk-${JAVA_VERSION}-jre

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt-get update && apt-get install -y \
    build-essential \
    python${PYTHON_VERSION} \
    python${PYTHON_VERSION}-dev \
    python${PYTHON_VERSION}-distutils

RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python /usr/bin/python3.11 1

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py

RUN python3 get-pip.py \
&&  rm get-pip.py

RUN useradd -ms /bin/bash bot \
    && usermod -aG sudo bot

RUN echo 'root:password' | chpasswd
RUN echo 'bot:password' | chpasswd

USER bot

WORKDIR ${BOT_HOME}
