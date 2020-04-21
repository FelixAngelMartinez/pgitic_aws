#!/bin/bash
if [ -d ~/.aws ];
then
echo "Directorio ~/.aws existente"
else
echo "Creando directorio ~/.aws"
mkdir ~/.aws
fi
if [ -f ~/.aws/config ];
then
echo "Actualizando archivos existentes"
cp config ~/.aws/
cp credentials ~/.aws/
else
echo "Copiando archivos"
cp -u config ~/.aws/
cp -u credentials ~/.aws/
fi
