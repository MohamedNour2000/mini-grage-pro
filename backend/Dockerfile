FROM php:8.3-fpm

WORKDIR /var/www/html

# Dépendances système
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    libzip-dev \
    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Copier le code du backend
COPY . /var/www/html

# Installer les dépendances Composer
RUN composer install --no-interaction --prefer-dist --no-progress --no-scripts --no-plugins

# Générer les scripts Laravel après installation
RUN php artisan package:discover --ansi || true

EXPOSE 9000
