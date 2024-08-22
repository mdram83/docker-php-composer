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

# Install composer
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

WORKDIR /apps