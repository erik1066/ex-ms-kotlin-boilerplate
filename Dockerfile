# build stage
FROM openjdk:11-jdk as builder

RUN mkdir -p src
COPY gradlew build.gradle /src/
COPY ./gradle /src/gradle
RUN /src/gradlew --no-daemon build || return 0

COPY . /src
WORKDIR /src
RUN ./gradlew --no-daemon build

# run stage
FROM openjdk:11-jre-slim

ARG KOTLIN_BOILERPLATE_FLUENTD_HOST
ARG KOTLIN_BOILERPLATE_FLUENTD_PORT

ENV KOTLIN_BOILERPLATE_FLUENTD_HOST ${KOTLIN_BOILERPLATE_FLUENTD_HOST}
ENV KOTLIN_BOILERPLATE_FLUENTD_PORT ${KOTLIN_BOILERPLATE_FLUENTD_PORT}

COPY --from=builder /src/build/libs/src-*-SNAPSHOT.jar /app.jar

# don't run as root user
RUN chown 1001:0 /app.jar
RUN chmod g+rwx /app.jar
USER 1001

ENTRYPOINT java -Dserver.tomcat.protocol-header=x-forwarded-proto -Dserver.tomcat.remote-ip-header=x-forwarded-for -jar /app.jar