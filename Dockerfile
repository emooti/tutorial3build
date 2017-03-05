# Dockerfile for Tutorial3
#GitHub and do a maven build it
FROM emooti/tutorbase
MAINTAINER Uta Kapp "uta.kapp@emooti.org"

ENV REFRESHED_AT 2016-04-12
ENV MAVEN_OPTS="-Xms512m -Xmx2048m -XX:MaxPermSize=512m"
ENV GIT_DISCOVERY_ACROSS_FILESYSTEM 1
RUN mvn -version
RUN sed -i -- 's/<servers>/<servers> <server><id>TomcatServer<\/id><username>admin<\/username> <password>pwd<\/password><\/server>/g' /usr/share/maven/conf/settings.xml

RUN mkdir Tutorial3
RUN cd Tutorial3 && pwd && git init && ls
RUN cd Tutorial3 && git remote
#pull from GitHub
# build
RUN cd Tutorial3 && git remote add emootitutor https://github.com/emootitutorial3/sourcecode.git
RUN cd Tutorial3 && git pull emootitutor HEAD
RUN cd Tutorial3/Emootiban  && mvn compile install
RUN cd Tutorial3/EmootiBan && mvn package
WORKDIR Tutorial3/EmootiBan
