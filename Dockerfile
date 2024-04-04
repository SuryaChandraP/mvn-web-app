FROM maven:3.8.1-openjdk-8 AS builder
COPY . /app
WORKDIR /app
RUN mvn clean package

FROM tomcat:9.0-jdk8-openjdk-slim
COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/
EXPOSE 8090
CMD ["catalina.sh", "run"]
