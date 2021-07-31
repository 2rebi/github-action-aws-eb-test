FROM adoptopenjdk/openjdk11:alpine-jre

LABEL email="fg9658@gmail.com"
LABEL name="hellp"
LABEL version="1.0"
LABEL description="demo application"

WORKDIR /app
COPY  ./app.jar .
EXPOSE 6666

CMD java -jar /app/app.jar
