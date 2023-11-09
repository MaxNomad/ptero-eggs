FROM jwigley/alpine-node-git-yarn:node-18

RUN apk --update --no-cache add curl ca-certificates nginx
RUN echo "UTC" > /etc/timezone

# Installing bash
RUN apk add bash

# Installing PHP
RUN apk add --no-cache php82 \
    php82-common \
    php82-fpm \
    php82-pdo \
    php82-opcache \
    php82-zip \
    php82-phar \
    php82-iconv \
    php82-cli \
    php82-curl \
    php82-openssl \
    php82-mbstring \
    php82-tokenizer \
    php82-fileinfo \
    php82-json \
    php82-xml \
    php82-xmlwriter \
    php82-simplexml \
    php82-dom \
    php82-pdo_mysql \
    php82-pdo_sqlite \
    php82-pecl-redis \
	php82-redis \
	php82-exif \
	php82-session \
	php82-soap \
	php82-gmp \
	php82-pdo_odbc \
	php82-mysqli \
	php82-sqlite3 \
	php82-pdo_pgsql \
	php82-bcmath \
	php82-gd \
	php82-odbc \
	php82-gettext \
	php82-xmlreader \
	php82-bz2 \
	php82-pdo_dblib \
	php82-ctype 

COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh


CMD ["/bin/ash", "/entrypoint.sh"]