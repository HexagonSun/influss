FROM postgres:alpine
RUN apk add ucspi-tcp
ADD ./init /docker-entrypoint-initdb.d/
