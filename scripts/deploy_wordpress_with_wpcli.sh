#!/bin/bash

# Cargar variables desde .env
source .env

# Verificar que WP-CLI esté instalado
if ! command -v wp &> /dev/null
then
    echo "Error: WP-CLI no está instalado. Instálalo y vuelve a intentarlo."
    exit 1
fi

# Paso 1: Descargar WordPress
echo "Descargando WordPress en ${WORDPRESS_PATH}..."
wp core download --locale="${WORDPRESS_LOCALE}" --path="${WORDPRESS_PATH}" --allow-root

# Paso 2: Crear la base de datos
echo "Creando base de datos '${DB_NAME}'..."
sudo mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;"
sudo mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
sudo mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'localhost';"
sudo mysql -u root -p"${MYSQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"

# Paso 3: Crear el archivo de configuración wp-config.php
echo "Creando archivo de configuración wp-config.php..."
wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="localhost" --path="${WORDPRESS_PATH}" --allow-root

# Paso 4: Instalar WordPress
echo "Instalando WordPress..."
wp core install \
  --url="${WORDPRESS_URL}" \
  --title="${WORDPRESS_TITLE}" \
  --admin_user="${ADMIN_USER}" \
  --admin_password="${ADMIN_PASSWORD}" \
  --admin_email="${ADMIN_EMAIL}" \
  --path="${WORDPRESS_PATH}" \
  --allow-root

# Paso 5: Ajustar permisos
echo "Ajustando permisos en ${WORDPRESS_PATH}..."
sudo chown -R www-data:www-data "${WORDPRESS_PATH}"

# Paso 6: Configurar enlaces permanentes
echo "Configurando enlaces permanentes..."
wp rewrite structure '/%postname%/' --path="${WORDPRESS_PATH}" --allow-root

echo "Despliegue de WordPress completado."
