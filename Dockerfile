# Use an official Maven base image with Java 11 (adjust Java version as needed)
FROM maven:3.9.6-eclipse-temurin-11

# Set environment variables
ENV MAVEN_OPTS="-Dmaven.repo.local=/root/.m2/repository"

# Set work directory
WORKDIR /app

# Copy all project files into the container
COPY . /app

# Optional: Speed up dependency resolution using a shared settings.xml
# COPY settings.xml /root/.m2/settings.xml

# Build the project (skip tests for faster build, remove -DskipTests if needed)
RUN mvn -B clean install -DskipTests

# Default command (can be overridden)
CMD ["mvn", "clean", "install"]
