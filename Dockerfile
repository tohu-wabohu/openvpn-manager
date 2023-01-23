FROM ubuntu:22.04

ARG EASYRSA_VERSION=3.1.2

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
  wget \
  vim \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
RUN wget https://github.com/OpenVPN/easy-rsa/releases/download/v${EASYRSA_VERSION}/EasyRSA-${EASYRSA_VERSION}.tgz
RUN tar -xvzf EasyRSA-${EASYRSA_VERSION}.tgz
RUN mv EasyRSA-${EASYRSA_VERSION} /app/easy-rsa

WORKDIR /app
