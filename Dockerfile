FROM node:lts-alpine3.16

LABEL "com.azure.dev.pipelines.agent.handler.node.path"="/usr/local/bin/node"

RUN apk update && \
    apk upgrade && \
    apk add \
    terraform \
    python3 \
    python3-dev \
    openssh-client \
    git \
    gcompat \
    bash \
    sudo \
    shadow

RUN ln -sf python3 /usr/bin/python && \
    python3 -m ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools && \
    python3 -m pip install pipenv
    
RUN npm install -g cdktf-cli

