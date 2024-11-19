#!/bin/bash

# Cargar variables desde .env
source .env

# Verificar que Certbot esté instalado
if ! command -v certbot &> /dev/null
then
    echo "Error: Certbot no está instalado. Instálalo y vuelve a intentarlo."
    exit 1
fi

# Instalar certificado SSL con Let’s Encrypt
echo "Solicitando certificado SSL para ${WORDPRESS_URL}..."
sudo certbot --apache -d "${WORDPRESS_URL}" --non-interactive --agree-tos --email "${ADMIN_EMAIL}"

# Configurar renovación automática
echo "Configurando renovación automática para Certbot..."
sudo systemctl enable certbot.timer
sudo systemctl start certbot.timer

echo "Certificado SSL configurado correctamente."
