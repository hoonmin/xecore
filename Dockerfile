FROM php:5.6-apache
MAINTAINER Hoonmin Kim <harebox@gmail.com>

RUN a2enmod rewrite

# PHP extensions
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd
RUN docker-php-ext-install mysqli

# XE-Core
RUN curl -o /var/www/xe.tar.gz -OL https://github.com/xpressengine/xe-core/releases/download/1.8.14/xe.1.8.14.tar.gz
RUN rm -rf /var/www/html
VOLUME /var/www/html
WORKDIR /var/www/html

# Command
ADD docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["apache2-foreground"]
