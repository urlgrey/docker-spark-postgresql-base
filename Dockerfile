# docker-spark-postgresql-base
#
# VERSION 0.0.2

FROM debian:wheezy
MAINTAINER Nick Poorman <mail@nickpoorman.com>

LABEL VERSION=0.0.2

RUN apt-get update && \
    apt-get install -y \
      openjdk-7-jre-headless \
      scala \
      curl \
      wget

RUN apt-get remove -y \
    scala-library \
    scala

# install scala 2.10.5
RUN cd /tmp && \
    wget -q http://downloads.typesafe.com/scala/2.10.5/scala-2.10.5.deb && \
    dpkg -i scala-2.10.5.deb && \
    rm -f scala-2.10.5.deb

LABEL SPARK_BUILD=0.0.2

RUN mkdir -p /spark && \
    wget -qO- http://storage.googleapis.com/ng-ml-storage/spark-1.3.2-SNAPSHOT-bin-2.4.0.tgz | tar -xz -C /spark --strip-components=1

ENV JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64
RUN update-alternatives --set java /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java
