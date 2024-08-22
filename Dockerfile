FROM php:8.3-cli

# Install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    zip \
    unzip \
    libzip-dev

# install composer
COPY --from=composer/composer:latest-bin /composer /usr/bin/composer

WORKDIR /apps