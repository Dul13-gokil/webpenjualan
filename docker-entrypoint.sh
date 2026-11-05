#!/bin/bash
set -e

PORT="${PORT:-80}"

# Ensure only mpm_prefork is loaded to avoid AH00534
rm -f /etc/apache2/mods-enabled/mpm_event.* /etc/apache2/mods-enabled/mpm_worker.* /etc/apache2/mods-enabled/mpm_itk.* 2>/dev/null || true

# Adjust Apache port configuration dynamically
sed -i "s/Listen 80/Listen $PORT/g" /etc/apache2/ports.conf
sed -i "s/:80/:$PORT/g" /etc/apache2/sites-available/000-default.conf

# Automatically import database.sql if DB credentials are provided
if [ -n "$MYSQLHOST" ] || [ -n "$DB_HOST" ]; then
    echo "[Entrypoint] Menjalankan pengecekan database otomatis..."
    sleep 3
    php /var/www/html/auto_import.php || true
fi

exec apache2-foreground
