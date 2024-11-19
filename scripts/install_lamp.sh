#Instalación de Apache, MySQL y PHP

#!/bin/bash

# Actualización del sistema
sudo apt update
sudo apt upgrade -y

# Instalación de Apache
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2

# Instalación de MySQL
sudo apt install mysql-server -y
sudo systemctl start mysql
sudo systemctl enable mysql

# Configuración de MySQL
sudo mysql_secure_installation

# Instalación de PHP
sudo apt install php libapache2-mod-php php-mysql -y

# Reiniciar Apache para cargar PHP
sudo systemctl restart apache2

echo "LAMP stack installed successfully!"


