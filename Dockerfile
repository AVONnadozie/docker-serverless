FROM node:18-alpine

# SERVERLESS_VERSION is set explicitly in the Makefile used to build, otherwise
# use latest version.
ARG SERVERLESS_VERSION=latest
#ARG SERVERLESS_OFFLINE_VERSION=latest
ENV SERVERLESS_VERSION $SERVERLESS_VERSION
#ENV SERVERLESS_OFFLINE_VERSION $SERVERLESS_OFFLINE_VERSION

RUN apk update
RUN apk add --no-cache nano less curl python3 git wget pkgconf pixman-dev python3-dev py-pip ca-certificates groff bash make jq g++ zip git openssh
RUN npm install -g serverless@$SERVERLESS_VERSION
RUN npm install -g serverless-offline

WORKDIR /opt/app
