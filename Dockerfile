FROM televidence/alpine-base:latest

WORKDIR /code

# Be verbose.
ENV NPM_CONFIG_LOGLEVEL verbose

# Add NPM package config
ADD package*.json ./

# Try to install everything (and clean up afterwards)
RUN apk update && apk add nodejs nodejs-npm && \
    apk add --no-cache --virtual .build \
    cmake \
    alpine-sdk \
    libpng \
    libpng-dev \
    libjpeg-turbo \
    libjpeg-turbo-dev \
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
