FROM khipu/openjdk17-alpine:latest
WORKDIR /app
COPY ./target/*.jar /app/app.jar
CMD ["java", "-jar", "app.jar"]
