FROM maven:3-alpine
WORKDIR '/app'
ADD src src
COPY pom.xml .
RUN mvn clean package

FROM openjdk:8-jre-alpine
WORKDIR '/demo_app'
COPY --from=0 /app/target/*.jar demo.jar
EXPOSE 80
CMD java -jar demo.jar
