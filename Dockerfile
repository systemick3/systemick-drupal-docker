FROM php:7.1.8-apache

MAINTAINER Mike Garthwaite

COPY . /srv/app
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

RUN apt-get update -y && apt-get install -y sendmail libpng-dev

RUN apt-get update && apt-get install -y zlib1g-dev

RUN docker-php-ext-install opcache mbstring gd pdo pdo_mysql && chown -R www-data:www-data /srv/app
