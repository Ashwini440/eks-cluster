FROM openjdk:17-jdk
WORKDIR /app
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} /app/app.jar
EXPOSE 8081
CMD ["sh", "-c", "java -jar /app/app.jar & while true; do sleep 30; done"]
#CMD ["java", "-jar", "/app/app.jar"]  # Instead of running in the background
