FROM php:fpm-alpine


MAINTAINER berrabe


## install dep package for php extension
RUN apk add --no-cache \
    autoconf \
    make \
    gcc \
    g++ \
    libxml2-dev \
    oniguruma-dev \
    icu-dev \
    git


# install PHP extension for databases and Laravel 8 and CI 4
RUN docker-php-ext-configure intl \
	&& docker-php-ext-install intl \
	mysqli \
	pdo \
	pdo_mysql \
	bcmath \
	tokenizer \
	ctype \
	fileinfo \
	xml \
	mbstring \
	&& docker-php-ext-enable mbstring 


# delete tmp files
RUN rm -rf /tmp/*


# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# set workdir
WORKDIR /code
