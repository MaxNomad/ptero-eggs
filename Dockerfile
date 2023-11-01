FROM alpine:latest

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk --update --no-cache add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/entrypoint.sh"]
