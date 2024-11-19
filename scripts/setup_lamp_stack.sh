#!/bin/bash

# Función para manejar errores
handle_error() {
    echo "Error en el paso $1. Saliendo..."
    exit 1
}

# Paso 1: Actualización del sistema
echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y || handle_error "Actualización del sistema"

# Paso 2: Instalación de LAMP
echo "Instalando la pila LAMP..."
bash scripts/install_lamp.sh || handle_error "Instalación de LAMP"

# Paso 3: Instalación de herramientas adicionales
echo "Instalando herramientas adicionales..."
bash scripts/install_tools.sh || handle_error "Instalación de herramientas adicionales"

# Paso 4: Configuración de .htaccess (si es necesario)
if [ -f "htaccess/.htaccess" ]; then
    echo "Configurando .htaccess..."
    sudo cp htaccess/.htaccess /var/www/html/.htaccess || handle_error "Configuración de .htaccess"
    sudo systemctl restart apache2 || handle_error "Reinicio de Apache"
fi

# Paso 5: Configuración adicional (opcional)
# Agrega más pasos si es necesario, como configurar usuarios de MySQL, permisos, etc.

echo "Pila LAMP y herramientas adicionales instaladas con éxito."
