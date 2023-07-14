#!/bin/bash
clear

# Se comprueba que se hayan pasado dos argumentos.
if [[ $# != 2 ]]; then
	exit 1
fi

echo "Descargando el archivo con las imágenes..."

wget -O $IMAGENES $1 2> /dev/null

echo "Descargando el archivo con la suma de verificación..." 

wget -O $SUMA $2 2> /dev/null

# Se cambia el nombre del archivo que contiene las imágenes dentro del archivo
# que contiene la suma de verificación por si el archivo original tiene un
# nombre distinto al esperado.
echo "$(cut -d " " -f 1 $SUMA) $IMAGENES" > $SUMA

# Se chequea que la suma de verificación sea correcta. De no serlo, se vuelve
# al menú.
echo "Comprobando la suma de verificación del archivo..."

sha256sum --check $SUMA &> /dev/null ||

{
	echo "La comprobación de la suma de verificación falló."
	read -p "Presione Enter para volver al menú."
	exit 2
}

echo "El archivo fue descargado y comprobado exitosamente."
read -p "Presione Enter para volver al menú."
