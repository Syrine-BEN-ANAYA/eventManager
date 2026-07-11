# ---- Build stage ------------------------------------------------------
FROM maven:3.9-eclipse-temurin-17 AS build

WORKDIR /app
COPY pom.xml .
COPY src ./src

# Point the JPA/Hibernate datasource at the "db" service defined in
# docker-compose.yml instead of localhost, and add MySQL 8 connection
# flags required by the connector.
RUN sed -i \
    's#jdbc:mysql://localhost:3306/event#jdbc:mysql://db:3306/event?useSSL=false\&allowPublicKeyRetrieval=true#' \
    src/main/resources/META-INF/persistence.xml

RUN mvn -B clean package -DskipTests

# ---- Runtime stage ------------------------------------------------------
FROM tomcat:9.0-jdk17-temurin

# Deploy the WAR as the root application so the app is served from "/"
RUN rm -rf /usr/local/tomcat/webapps/ROOT
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
