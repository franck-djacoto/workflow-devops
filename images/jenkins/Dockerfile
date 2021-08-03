FROM jenkins/jenkins:2.276
USER root

RUN apt-get -y  update && apt-get install -y apt-transport-https
RUN apt-get -y update  && apt-get install curl -y
RUN curl -y -fsSL https://get.docker.com | sh

RUN groupadd -g 998 docker 
RUN usermod -aG docker jenkins

USER jenkins

