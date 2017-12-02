FROM alpine:3.7

WORKDIR /code

# Be verbose.
ENV NPM_CONFIG_LOGLEVEL verbose
#ENV CC=clang
#ENV CXX=clang++

# Add NPM package config
ADD package*.json ./

# Try to install everything (and clean up afterwards)
RUN apk update && apk add nodejs && \
    apk add --no-cache --virtual .build \
    autoconf \
    automake \
    alpine-sdk \
    libpng-dev \
    libtool \
    make \
    python \
    nasm \
    git \
    make \
    wget \
    zip \
    bash && \
  npm install && \
  apk del .build

# Add the remaining project files (PROTIP: there aren't any)
ADD . .
