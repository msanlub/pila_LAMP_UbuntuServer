#Instalación de phpMyAdmin, Adminer y GoAccess

#!/bin/bash

# Variables de entorno
source .env

# Instalación de phpMyAdmin
sudo apt install phpmyadmin -y
sudo ln -s /usr/share/phpmyadmin /var/www/html/phpmyadmin

# Instalación de Adminer
sudo mkdir /var/www/html/adminer
sudo wget -q https://www.adminer.org/latest.php -O /var/www/html/adminer/index.php

# Instalación de GoAccess
sudo apt install goaccess -y

echo "Additional tools installed successfully!"
