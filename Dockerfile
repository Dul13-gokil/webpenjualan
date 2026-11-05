FROM php:8.2-apache

# Install system dependencies and PHP extensions (mysqli, gd, pdo, zip)
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libzip-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql zip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Fix Apache MPM conflict (Ensure only mpm_prefork is enabled)
RUN rm -f /etc/apache2/mods-enabled/mpm_event.* \
          /etc/apache2/mods-enabled/mpm_worker.* \
          /etc/apache2/mods-enabled/mpm_itk.* \
    && a2dismod mpm_event mpm_worker mpm_itk || true \
    && a2enmod mpm_prefork rewrite

# Copy project files into web root
COPY . /var/www/html/

# Set up uploads directory and permissions
RUN mkdir -p /var/www/html/uploads/payment_proofs \
             /var/www/html/uploads/arrival_confirmations \
    && chown -R www-data:www-data /var/www/html/uploads \
    && chmod -R 777 /var/www/html/uploads

# Set up entrypoint script
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]
