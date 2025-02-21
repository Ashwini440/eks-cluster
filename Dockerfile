FROM openjdk:17-jdk
WORKDIR /app
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} /app/app.jar
EXPOSE 4000
#CMD ["java", "-jar", "/app/app.jar"]  # Instead of running in the background
CMD ["sh", "-c", "while true; do java -jar /app/app.jar; sleep 5; done"]
