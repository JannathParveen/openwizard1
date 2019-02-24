Course of action:

Java, Maven and git installed.
Cloned the haroonzone repository to import the application to local desktop. Created branch Jannath_changes in git for doing the changes as on the mail.
Changed the port on the example.yaml to host the application on 9090 and 9091 (for discretion).

Compiled and built the jar using maven. Maven is easy to use for any java application for its automation.


Please find the Hello World response

The console displayed any input name in the Hello $name, and the id incremented by 1 for each hit of the link.



Please find the Health check response



The application and its jar was copied into a docker container with the below Dockerfile as a first step.

FROM openjdk:8
ADD target/hello-dropwizard-1.0-SNAPSHOT.jar /data/hello-dropwizard-1.0-SNAPSHOT.jar
ADD example.yaml /data/example.yaml
CMD java -jar /data/hello-dropwizard-1.0-SNAPSHOT.jar server /data/example.yaml
EXPOSE 9090-9091


Created image using - docker build –f Dockerfile –t hellowizard .

The application build and full automation was done in the next step of Docker file creation.

FROM openjdk:8
RUN git clone https://github.com/haroonzone/hello-dropwizard.git
RUN apt-get update -y && apt-get install maven -y
RUN cd hello-dropwizard && mvn package
CMD java -jar /target/hello-dropwizard-1.0-SNAPSHOT.jar server example.yaml
EXPOSE 9090-9091



