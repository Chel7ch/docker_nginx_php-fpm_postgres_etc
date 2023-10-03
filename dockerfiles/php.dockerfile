FROM php:8.1-fpm-alpine

ARG UID
ARG GID

ENV UID=${UID}
ENV GID=${GID}

RUN mkdir -p /var/www/html

WORKDIR /var/www/html

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN addgroup -g ${GID} --system laravel
RUN adduser -G laravel --system -D -s /bin/sh -u ${UID} laravel

RUN sed -i "s/user = www-data/user = laravel/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = laravel/g" /usr/local/etc/php-fpm.d/www.conf
RUN echo "php_admin_flag[log_errors] = on" >> /usr/local/etc/php-fpm.d/www.conf

RUN apk add --update \
    bash \
    curl \
    zip \
    unzip \
    icu-dev \
    php-json \
    php-pdo \
    postgresql-dev \
    php-pdo_mysql \
    php-pdo_sqlite \
    php-xsl \
    php-gd \
    php-sodium \
    php-ctype \
    php-mbstring \
    php-xml \
    php-xmlreader \
    php-xsl \
    php-zip \
    php-zlib \
    php-iconv \
    php-session \
    php-phar \
    php-posix \
    php-opcache\
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql intl

RUN mkdir -p /usr/src/php/ext/redis \
    && curl -L https://github.com/phpredis/phpredis/archive/5.3.4.tar.gz | tar xvz -C /usr/src/php/ext/redis --strip 1 \
    && echo 'redis' >> /usr/src/php-available-exts \
    && docker-php-ext-install redis

USER laravel

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]