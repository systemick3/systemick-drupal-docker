FROM php:7.1.8-apache

MAINTAINER Mike Garthwaite

COPY . /srv/app
COPY .docker/vhost.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

RUN apt-get update -y && apt-get install -y sendmail imagemagick libmcrypt-dev libpng-dev libjpeg-dev libjpeg62-turbo-dev libfreetype6-dev zlib1g-dev git mysql-client zip unzip vim

RUN docker-php-ext-install opcache mbstring mcrypt iconv pdo pdo_mysql fileinfo json 

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install -j$(nproc) gd && chown -R www-data:www-data /srv/app

RUN echo -e "\n\nexport PATH=/root/.composer/vendor/bin:$PATH" >> /root/.bashrc
