FROM composer as temp-composer

COPY . /app/

RUN composer install  \
    --ignore-platform-reqs \
    --no-ansi \
    --no-autoloader \
    --no-interaction \
    --no-scripts

FROM temp-composer as local-composer

ENTRYPOINT ["docker/composerEntrypoint.sh"]

FROM php:7.4-apache-buster as php-base

COPY src /var/www/html

RUN docker-php-ext-install pdo_mysql \
    && chown -R www-data:www-data /var/www/html

FROM php-base as php-local

COPY docker/debugphp.ini /usr/local/etc/php/conf.d/debugphp.ini

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

FROM php-base as php-default

COPY --from=temp-composer /app/vendor /var/www/vendor