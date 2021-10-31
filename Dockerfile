FROM ubuntu:18.04
WORKDIR /home
COPY agent.jar .
RUN apt-get update -y && apt-get install curl openjdk-11-jdk git maven -y
RUN adduser --disabled-password --gecos "" jenkins
RUN curl -fsSL https://get.docker.com/ | sh
CMD [ "/usr/bin/java", "-jar", "agent.jar", "-jnlpUrl", "http://10.14.22.148:8880/computer/dupa/jenkins-agent.jnlp", "-secret", "7b297f55b6b58c53fee0bce3ef96723781955484c5d00dffb0edf61a70267da6", "-workDir", "\"/home\""]