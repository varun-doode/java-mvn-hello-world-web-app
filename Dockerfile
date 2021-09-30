FROM maven:3.8.2-openjdk-17 as maven_project
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat:jre8-openjdk-buster
COPY --from=maven_project /app/target/mvn-hello-world.war /usr/local/tomcat/webapps
