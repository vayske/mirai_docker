FROM ubuntu:22.04

USER rumina

ARG DEBIAN_FRONTEND=noninteractive
ARG PYTHON_VERSION
ARG JAVA_VERSION
ARG GIT_PAT
ARG MIRAI_GIT
ARG ARIADNE_GIT
ARG BRANCH

ENV LANG=C.UTF-8
ENV RUMINA_HOME=/home/rumina
ENV BOT_HOME=${RUMINA_HOME}/bot
ENV ARIADNE_DIR=${BOT_HOME}/ariadne
ENV MIRAI_DIR=${BOT_HOME}/mirai

WORKDIR ${RUMINA_HOME}

RUN apt-get update && apt-get install -y \
    software-properties-common \
    git \
    screen \
    curl \
    openjdk-${JAVA_VERSION}-jre

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt-get update && apt-get install -y python${PYTHON_VERSION} \
    &&  apt-get clean \
    &&  rm -rf /var/lib/apt/lists/*

RUN mkdir -p ${BOT_HOME}

# RUN mkdir -p ${BOT_HOME} \
# &&  cd ${BOT_HOME} \
# &&  git clone -b ${BRANCH} --progress ${ARIADNE_GIT} .

# RUN pip install -r ${ARIADNE_DIR}/requirements.txt

# RUN cd ${BOT_HOME} \
# &&  rm -rf .git*

# ENTRYPOINT [ "/home/rumina/docker/init.sh" ]
