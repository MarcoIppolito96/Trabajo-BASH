#!/bin/bash
if [[ $# != 1 ]]; then
	exit 1
fi

# Constantes
ARCHIVO_NOMBRES="nombres.csv"
DIR_TEMPORAL=".tmp"
LINK="https://thispersondoesnotexist.com/"
FORMATO="jpg"
ARCHIVO_SALIDA="imagenes.tar.gz"

# Se crea una lista de nombres a partir de el archivo CSV provisto.
NOMBRES=$(sort -R $ARCHIVO_NOMBRES | head -n $1 | cut -d "," -f 1 | cut -d " " -f 1)

# Se crea un directorio temporal para guardar las imágenes.
mkdir $DIR_TEMPORAL 2> /dev/null

# Se descargan las imágenes, asignándoseles un nombre de la lista de nombres.
CONT=0
for NOMBRE in $NOMBRES; do
	wget -O "$DIR_TEMPORAL/$NOMBRE.$FORMATO" $LINK 2> /dev/null
	CONT=$((CONT + 1))
	echo "Generando imágenes... ($CONT/$1)"
	sleep 1
done

echo "Imágenes generadas. Comprimiendo..."

# Se comprimen las imágenes
tar -C $DIR_TEMPORAL -czf $ARCHIVO_SALIDA ./

# Se calcula la suma de verificación y se guarda en un archivo
echo $(sha256sum $ARCHIVO_SALIDA) > $ARCHIVO_SALIDA.sha256

# Se borra el directorio temporal
rm -r $DIR_TEMPORAL

echo "Imágenes generadas y comprimidas en $ARCHIVO_SALIDA"
read -p "Presione cualquier tecla para continuar..."