FROM eclipse-temurin:21-jdk

WORKDIR /app

COPY app/app.java .

RUN javac app.java

CMD ["java", "app"]