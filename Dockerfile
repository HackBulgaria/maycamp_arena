FROM ubuntu:14.04
MAINTAINER Valentin Mihov <valentin.mihov@gmail.com>
RUN mkdir /sandbox
RUN apt-get update && apt-get install -y openjdk-7-jre-headless ruby ruby-dev make python2.7 python3
RUN gem install rprocfs

WORKDIR /sandbox
