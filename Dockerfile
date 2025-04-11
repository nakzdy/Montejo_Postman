FROM php:8.1-fpm-alpine

# Install system dependencies
RUN apk update && apk add --no-cache --virtual .build-deps \
    git \
    curl \
    libzip-dev \
    unzip

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql zip bcmath

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Generate application key
RUN php artisan key:generate --ansi

# Set storage directory permissions
RUN chmod -R 755 storage bootstrap/cache

# Expose port (if needed for direct access, but likely handled by a web server)
# EXPOSE 9000

# Command to run PHP-FPM
CMD ["php-fpm"]