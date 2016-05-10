# DOCKER-VERSION 1.9.1
FROM ubuntu:14.04
MAINTAINER Jim Rosser, jarosser06@gmail.com

ENV DYNAMODB_LOCAL_PKG dynamodb_local_latest.tar.gz

RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless wget curl
RUN mkdir /opt/dynamodb
RUN curl -L http://dynamodb-local.s3-website-us-west-2.amazonaws.com/${DYNAMODB_LOCAL_PKG} | tar -C /opt/dynamodb -xz

EXPOSE 8000
CMD ["java", "-Djava.library.path=/opt/dynamodb/DynamoDBLocal_lib", "-jar", "/opt/dynamodb/DynamoDBLocal.jar"]
