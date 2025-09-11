# Stage 1: Build with Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run with Tomcat
FROM tomcat:9.0.89-jdk17-temurin
# Xóa webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy WAR đã build vào Tomcat
COPY --from=build /app/target/cart.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
