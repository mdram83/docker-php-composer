FROM php:8.3-cli

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libzip-dev

# Install pcov and xdebug via PECL
RUN pecl install pcov xdebug && docker-php-ext-enable pcov xdebug

# Set PHP configurations
RUN echo "error_reporting=-1" >> /usr/local/etc/php/conf.d/error_reporting.ini \
    && echo "memory_limit=-1" >> /usr/local/etc/php/conf.d/memory_limit.ini

# Set Xdebug configurations
RUN echo "xdebug.show_exception_trace=0" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.mode=coverage,develop" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini


# Install composer
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

WORKDIR /apps