# Stage 1: Download the artifact securely
FROM alpine:3.14 as downloader
ARG NEXUS_USER
ARG NEXUS_PASSWORD
RUN apk add --no-cache curl
RUN curl -u "${NEXUS_USER}:${NEXUS_PASSWORD}" \
    "http://16.16.198.193:8082/repository/ex/in/javahome/hiring/0.1/hiring-0.1.war" \
    -o /hiring.war

# Stage 2: Build the final image
FROM tomcat:9.0-jdk11
COPY --from=downloader /hiring.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
