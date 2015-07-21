# docker-spark-postgresql-base
#
# VERSION 0.0.2

FROM debian:wheezy
MAINTAINER Nick Poorman <mail@nickpoorman.com>

LABEL VERSION=0.0.2

# Add Oracle Java repository
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" > /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update

# Install Oracle Java 8
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y oracle-java8-installer oracle-java8-set-default
RUN apt-get clean

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

RUN apt-get update && \
    apt-get install -y \
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

LABEL SPARK_BUILD=0.0.7

RUN mkdir -p /spark && \
    wget -qO- http://storage.googleapis.com/ng-ml-storage/spark-1.3.2-SNAPSHOT-bin-2.4.0.tgz | tar -xz -C /spark --strip-components=1
