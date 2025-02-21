# Step 1: Use an official OpenJDK base image from Docker Hub
FROM openjdk:11-jre-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the Spring Boot application JAR file into the container
COPY target/cluster_jar-1.0-SNAPSHOT.jar /app/cluster_jar-1.0-SNAPSHOT.jar

# Step 4: Expose the port the app will be listening on
EXPOSE 8081

# Step 5: Command to run the Spring Boot application when the container starts
#ENTRYPOINT ["java", "-jar", "cluster_jar-1.0-SNAPSHOT.jar"]
CMD ["sh", "-c", "while true; do java -jar /app/cluster_jar-1.0-SNAPSHOT.jar; sleep 5; done"]
