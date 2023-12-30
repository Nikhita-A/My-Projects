FROM maven:3.9.6-amazoncorretto-17 AS builder
COPY spring-petclinic /spring-petclinic
RUN cd /spring-petclinic && mvn package


FROM amazoncorretto:17-alpine3.17 
LABEL owner="nikhita"
LABEL purpose="dockerlearning"
ARG ARTIFACT_LOCATION='/spring-petclinic/target/spring-petclinic-3.2.0-SNAPSHOT.jar'
ARG USERNAME='petclinic'
ARG HOMEDIR='/petclinic'
RUN adduser -h ${HOMEDIR} -s /bin/sh -D ${USERNAME}
USER ${USERNAME}
WORKDIR ${HOMEDIR}
COPY --from=builder --chown=${USERNAME}:${USERNAME} ${ARTIFACT_LOCATION} ${HOMEDIR}/spring-petclinic-3.2.0-SNAPSHOT.jar
EXPOSE 8080
CMD [ "java", "-jar", "spring-petclinic-3.2.0-SNAPSHOT.jar" ]