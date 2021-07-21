#
# Build stage
#
FROM maven:3.6.0-jdk-11-slim AS build
# Package stage
# 
FROM openjdk:11-jre-slim
#COPY --from=build /home/app/target/jwordpress-0.7.0.jar /usr/local/lib/jwordpress-0.7.0.jar
COPY --from=build /var/lib/jenkins/workspace/WPPipeline/target/jwordpress-0.7.0.jar /usr/local/lib/jwordpress-0.7.0.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/jwordpress-0.7.0.jar"]
