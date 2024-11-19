# Opciones para Transferir los Scripts a la Máquina Virtual
## Opción 1: Usar SSH y scp (si tienes SSH configurado)
- Habilita SSH en la máquina virtual:

Instala y activa el servidor SSH en Ubuntu Server si aún no está instalado.	
```bash
 sudo apt update
 sudo apt install openssh-server -y
 sudo systemctl enable ssh
 sudo systemctl start ssh
```

- Obtén la dirección IP de la máquina virtual.
```bash
ip a
```

- Desde tu máquina host, usa scp para transferir los scripts:
```bash
scp -r /path/to/scripts_directory/ user@<ip_address>:/home/user/
```

Reemplaza /path/to/scripts_directory/ con la ruta en tu máquina host donde están los scripts, user con tu usuario en Ubuntu Server, y <ip_address> con la IP de tu máquina virtual.

Accede a la máquina virtual y navega al directorio donde transferiste los scripts.

## Opción 2: Usar Carpetas Compartidas de VirtualBox
- Configura una carpeta compartida:

En VirtualBox, ve a la configuración de la máquina virtual.

Selecciona "Carpetas compartidas" > "Agregar carpeta compartida".

Selecciona una carpeta en tu máquina host y marca "Automontar".

- Accede a la carpeta compartida desde Ubuntu Server:

Monta manualmente la carpeta compartida si no se monta automáticamente.
```bash
sudo mount -t vboxsf shared_folder_name /mnt/shared
```

Copia los scripts desde /mnt/shared a un directorio local en la máquina virtual.

```bash
cp /mnt/shared/scripts_directory/* /home/user/scripts/
```

## Opción 3: Manual
Descarga los scripts dentro de la máquina virtual:

Si subiste los scripts a GitHub o algún otro servicio de almacenamiento, puedes clonarlos directamente:

```bash
sudo apt install git -y
git clone https://github.com/tu_usuario/tu_repositorio.git
```
Navega al directorio clonado y ejecuta los scripts.


# Ejecución del Script Maestro
Una vez que los scripts están en la máquina virtual:

Asegúrate de que los scripts están en su lugar:
```bash
ls /home/user/scripts
```
*Ejecuta el script maestro:*
```bash
sudo bash /home/user/setup_lamp_stack.sh
```

