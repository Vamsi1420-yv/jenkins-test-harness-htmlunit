# Use Maven with Eclipse Temurin Java 17
FROM maven:3.9.6-eclipse-temurin-17

# Set working directory
WORKDIR /app

# Copy all files into the container
COPY . /app

# Optional: Add settings.xml if you use Jenkins plugin repos
# COPY settings.xml /root/.m2/settings.xml

# Build the project (skip tests for speed)
RUN mvn -B clean install -DskipTests

# Default command
CMD ["mvn", "clean", "install"]
