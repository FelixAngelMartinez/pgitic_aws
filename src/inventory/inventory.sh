#!/bin/bash
python -c "import ansible"
if [[ $? -eq 0 ]];
then
	echo "Librerias instaladas"
else
	pip install ansible
fi

if [ -f /etc/ansible/ec2.ini ];
then
	echo "Actualizando archivos existentes"
	cp -u ec2.ini /etc/ansible/
else
	echo "Copiando archivos"
	cp ec2.ini /etc/ansible/
fi

if [ -z "$AWS_ACCESS_KEY_ID" ] && [ -z "$AWS_SECRET_ACCESS_KEY" ];
then
	echo "Faltan las claves secretas y el identificador de esta"
	echo "AWS_ACCESS_KEY_ID"
	read aws_access_key
	export AWS_ACCESS_KEY_ID='$aws_access_key'
	echo "AWS_SECRET_ACCESS_KEY"
	read aws_secret_access_key
	export AWS_SECRET_ACCESS_KEY='$aws_secret_access_key'
else
	echo "Clave secreta e identificador de estan correctas"
fi

if [ -f ../config/pgitic-key.pem ];
then
	echo "Actualizando inventario"
	./ec2.py --refresh-cache
	ansible all -i ec2.py -u ubuntu -m ping --private-key ../config/pgitic-key.pem
else
	echo "Falta el archivo pgitic-key.pem en el directorio /config"
	exit 1;
fi


