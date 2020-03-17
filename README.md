# pgitic_aws
_Proyecto para la asignatura del Máster en Ingeniería Informática llamada Planificación y Gestión de Infraestructuras TIC, en la cual se empleará Ansible y Vagrant para la creación, aprovisionamiento y configuración de máquinas virtuales empleando el suministrador de servicios en la nube Amazon Web Services (AWS)._

##Instalación
Instalación aplicada a máquina **Ubuntu 19**
Pasos previos a la ejecución del "Vagrant up"
``` 
$ sudo apt update
```

###Instalación Ansible:
[Guía oficial de instalación Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#)
```
$ sudo apt install software-properties-common
$ sudo apt-add-repository --yes --update ppa:ansible/ansible
$ sudo apt install -y ansible
$ ansible --version
```

###Instalación Vagrant:
[Guía oficial de instalación Vagrant](https://www.vagrantup.com/docs/installation)
```
$ wget https://releases.hashicorp.com/vagrant/2.2.7/vagrant_2.2.7_x86_64.deb
$ sudo dpkg -i vagrant_2.2.7_x86_64.deb
$ vagrant --version
```

###Configuración AWS:
Vamos a la [Guia de key pairs](https://docs.aws.amazon.com/es_es/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
Accedemos a la consola EC2, buscamos la opcion Key-Pairs.
Creamos un par de claves con el nombre pgitic-aws y la descargamos en el formato .pem.
```
$ mkdir ~/aws_repo/
```
Pegamos nuestra clave con el nombre "pgitic-aws.pem"
```
$ sudo cp pgitic-aws.pem ~/aws_repo/
```

###Instalación plugin AWS para Vagrant:
```
$ sudo apt install -y python-pip
$ sudo pip install boto
$ vagrant plugin install vagrant-aws
$ mkdir ~/.aws
```
Creamos un fichero llamado "config" y le añadimos lo siguiente:
``` 
[default]
region = eu-east-2
```
Creamos un fichero llamado "credentials" y le añadimos lo siguiente:
```
aws_access_key_id = <USUARIOAMAZON>
aws_secret_access_key = <CONTRASEÑUSUARIO>
```
Nota: si falla el instalador, ejecutar: $ sudo apt --fix-broken install

##Ejecución:
Nos dirigimos al directorio /src que es donde encontramos tanto el playbook de Ansible como de Vagrant y ejecutamos:
```
$ vagrant up
```

##Licencia:
Proyecto bajo licencia [LICENSE.md](LICENSE.md)

---
Proyecto realizado por: [Félix Ángel Martínez](https://github.com/FelixAngelMartinez)
