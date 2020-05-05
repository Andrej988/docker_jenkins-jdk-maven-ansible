FROM jenkins/jenkins:lts-jdk11

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# switching to root user for installation of maven & ansible
USER root

# install plugins
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

#==========
# Maven
#==========
ENV MAVEN_VERSION 3.6.3

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
#RUN mvn -version

#==========
# Ansible
#==========
RUN echo "deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" >> /etc/apt/sources.list \
&& apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
&& apt-get update \
&& apt-get install -y ansible
#RUN ansible --version

#===========
# Linux tree
#===========
RUN apt-get install -y tree

RUN apt-get clean

# Switching to user jenkins
USER jenkins

HEALTHCHECK CMD mvn -version
HEALTHCHECK CMD ansible --version
