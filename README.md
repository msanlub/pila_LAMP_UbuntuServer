# Pila_LAMP_UbuntuServer
En esta práctica tendremos que crear una máquina virtual con la última versión de Ubuntu Server, y crear el proceso automatizado para instalar todos los paquetes necesarios para tener una pila LAMP y todas las herramientas adicionales.

Antes de empezar contamos con una máquina virtual con Ubuntu Server instalado.

## Cómo Ejecutar el Script Maestro
- Preparación de Scripts

Asegúrate de que todos los scripts necesarios estén en el directorio scripts y sean ejecutables:

```bash
chmod +x scripts/install_lamp.sh
chmod +x scripts/install_tools.sh
chmod +x setup_lamp_stack.sh
```

Ejecuta el script maestro:

```bash
bash setup_lamp_stack.sh
```

## Pasos del Script
### 1. Actualización del Sistema:

Actualiza los paquetes y el sistema para asegurarte de tener las últimas versiones.

### 2. Instalación de LAMP:

- Apache: Instalación y activación del servicio

- MySQL: Instalación y configuración inicial de seguridad

- PHP: Instalación y configuración para trabajar con Apache

### 3. Instalación de Herramientas Adicionales:

- phpMyAdmin: Herramienta web para administración de bases de datos MySQL

- Adminer: Alternativa ligera a phpMyAdmin
- GoAccess: Analizador de logs en tiempo real para Apache

### 4. Configuración de .htaccess (Opcional):

- Control de acceso a directorios
- Útil para proteger secciones del sitio web con autenticación

### 5. Configuraciones Adicionales (Opcional):

- Personalización de usuarios MySQL
- Configuración de permisos especiales

### 6. Reinicios y Configuraciones:

- Reinicio de Apache después de configuraciones importantes

# Verificación de Servicios
Después de ejecutar el script maestro:

### Verificar Apache
```bash
sudo systemctl status apache2
```

### Verificar MySQL
```bash
sudo systemctl status mysql
```

### Acceso a tu servidor web
- Abre un navegador y visita http://localhost o http://<tu_ip> para ver la página de Apache.

- Prueba http://<tu_ip>/phpmyadmin para acceder a phpMyAdmin.

- Prueba http://<tu_ip>/adminer para Adminer.

## Importante
- Configuración de MySQL: 
Durante la instalación de MySQL, puedes configurar la contraseña del usuario root.

- phpMyAdmin: 
Durante la instalación, se te pedirá seleccionar el servidor web (Apache) y configurar la contraseña de la base de datos.

- Archivos Sensibles: 
Asegúrate de configurar correctamente .env con tus credenciales.