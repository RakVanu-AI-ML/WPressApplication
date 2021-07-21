#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build

# Package stage
#
FROM openjdk:11-jre-slim
COPY --from=build /home/app/target/jwordpress.jar /usr/local/lib/jwordpress.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/demo.jar"]
