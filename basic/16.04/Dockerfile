FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive


RUN sed -i "s/archive.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    sed -i "s/security.ubuntu.com/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    apt-get update &&\
    apt-get install -y -qq \
    apt-utils \
    build-essential \
    cmake \
    git \
    vim \
    curl \
    wget \
    libboost-all-dev\
    python3 \
    python3-pip \
    libceres-dev
