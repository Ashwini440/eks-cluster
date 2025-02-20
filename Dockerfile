FROM openjdk:17-jdk
WORKDIR /app
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
EXPOSE 8081
CMD ["sh", "-c", "java -jar /app/App.jar & while true; do sleep 30; done"]
