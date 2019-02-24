FROM openjdk:8

RUN git clone https://github.com/haroonzone/hello-dropwizard.git
RUN apt-get update -y && apt-get install maven -y
RUN cd hello-dropwizard && mvn package
CMD java -jar /target/hello-dropwizard-1.0-SNAPSHOT.jar server example.yaml
EXPOSE 9090-9091
