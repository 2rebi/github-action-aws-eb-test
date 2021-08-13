FROM adoptopenjdk/openjdk11:alpine-slim as builder
LABEL email="fg9658@gmail.com"
LABEL name="hellp"
LABEL version="1.0"
LABEL description="demo application"

WORKDIR /app
COPY . .
#RUN chmod -x ./gradlew
RUN ./gradlew bootJar

FROM adoptopenjdk/openjdk11:alpine-jre as distribution

MAINTAINER HellP <fg9658@gmail.com>

WORKDIR /app
COPY --from=builder /app/build/libs/app.jar .
EXPOSE 8000
CMD java -jar /app/app.jar

# FROM adoptopenjdk/openjdk11:alpine-jre

# LABEL email="fg9658@gmail.com"
# LABEL name="hellp"
# LABEL version="1.0"
# LABEL description="demo application"

# WORKDIR /app
# COPY  ./app.jar .
# EXPOSE 3333

# CMD java -jar /app/app.jar
