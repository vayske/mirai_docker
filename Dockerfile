FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
ARG PYTHON_VERSION
ARG JAVA_VERSION
ARG USERNAME

ENV LANG=C.UTF-8
ENV TERM=xterm-256color
ENV BOT_HOME=/home/${USERNAME}/bot
ENV ARIADNE_DIR=${BOT_HOME}/ariadne
ENV MIRAI_DIR=${BOT_HOME}/mirai

RUN apt-get update && apt-get install -y \
    software-properties-common \
    sudo \
    screen \
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
    && rm get-pip.py

RUN sed -i 's/#force_color_prompt=yes/force_color_prompt=yes/g' /root/.bashrc

RUN useradd -ms /bin/bash ${USERNAME} \
    && usermod -aG sudo ${USERNAME}

RUN echo 'root:password' | chpasswd
RUN echo '${USERNAME}:password' | chpasswd

USER ${USERNAME}

WORKDIR ${BOT_HOME}
