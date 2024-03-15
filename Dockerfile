FROM maven:3.6.3-jdk-11 as mavenbuilder
ARG TEST=/home/devops
WORKDIR $TEST
COPY . .
RUN  mvn clean package
#RUN which mvn
#RUN ls target/
#RUN pwd

FROM tomcat:9.0
ARG TEST=/home/devops
COPY --from=mavenbuilder ${TEST}/target/hello-world-war-1.0.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]
