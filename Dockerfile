FROM openjdk:13-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
RUN apk --update add postgresql-client
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","pl.codeleak.samples.springboot.tc.SpringBootTestcontainersApplication"]