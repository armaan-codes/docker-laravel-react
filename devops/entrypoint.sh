#!/bin/bash

# Laravel Docker Entrypoint Script
set -e

echo "Starting Laravel container setup..."

# Wait for database to be ready
echo "Waiting for database connection..."
sleep 10
echo "Proceeding with Laravel setup..."

# Install node dependencies and build assets
if [ -f package.json ]; then
    echo "Installing node dependencies..."
    npm install
    echo "Building assets..."
    npm run build
fi

# Install composer dependencies
echo "Installing composer dependencies..."
composer install --optimize-autoloader

# Generate application key if not set
if [ -z "$APP_KEY" ] || [ "$APP_KEY" = "" ]; then
    echo "Generating application key..."
    php artisan key:generate --force
fi

# Run database migrations
echo "Running database migrations..."
php artisan migrate --force

# Seed the database
echo "Seeding database..."
php artisan db:seed --force

# Clear and cache config
echo "Caching configuration..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Set proper permissions
echo "Setting permissions..."
chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache 2>/dev/null || true
chmod -R 755 /var/www/html/storage
chmod -R 755 /var/www/html/bootstrap/cache

echo "Laravel setup complete!"

# Start supervisord
exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
