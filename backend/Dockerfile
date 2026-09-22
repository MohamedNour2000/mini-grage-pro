FROM richarvey/nginx-php-fpm:latest

# Copier le code du backend
COPY . /var/www/html

# Configurations d'environnement
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Variables Laravel
ENV APP_ENV production
ENV APP_DEBUG false

# Installer les dépendances Composer
RUN composer install --no-dev --working-dir=/var/www/html

EXPOSE 80
