FROM openjdk:8-jdk-alpine
EXPOSE 8080
RUN mkdir -p /home/app
COPY ./target/java-maven-app-*.jar /home/app
WORKDIR /home/app
CMD ["java","-jar","java-maven-app-*jar"]

