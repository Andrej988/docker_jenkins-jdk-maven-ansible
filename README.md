# Andrej988/jenkins-jdk-maven-ansible
Jenkins with java, maven, ansible and pre-installed plugins
Latest versions:
- JDK 11,
- Maven 3.6.3 
- Ansible 2.9.7

It is build on top of official jenkins/jenkins image. Configurations and use is the same as in official image. More info about official image and usage: https://github.com/jenkinsci/docker/blob/master/README.md

Usage:
- jdk11 latest: docker pull andrej988/jenkins-jdk-maven-ansible:latest
- jdk8 latest: docker pull andrej988/jenkins-jdk-maven-ansible:jdk8-latest

Automatically configured user admin/admin

List of jenkins plugins to be automatically installed:
- ansible
- ant
- antisamy-markup-formatter
- build-pipeline-plugin
- build-timeout
- cloudbees-folder
- cvs
- credentials-binding
- dashboard-view
- email-ext
- favorite
- git
- github
- github-branch-source
- gradle
- jenkins-multijob-plugin
- javadoc
- ldap
- mailer
- matrix-auth
- monitoring
- pam-auth
- performance
- pipeline-stage-step
- pipeline-stage-view
- plain-credentials
- role-strategy
- script-security
- ssh-credentials
- ssh-slaves
- subversion
- timestamper
- workflow-aggregator
- workflow-api
- ws-cleanup
- view-job-filters
