#!/bin/bash
clear

# Se comprueba que se haya pasado sólo un argumento
# y que dicho argumento sea un número mayor a 1.
if [[ $# != 1 ]] || [[ $1 < 1 ]]; then
	exit 1
fi

# Constantes
ARCHIVO_NOMBRES="nombres.csv"
LINK="https://thispersondoesnotexist.com/"

# Se determina el formato de las imágenes a descargar.
FORMATO=$(wget --spider $LINK 2>&1 | grep Length: | tr -s "[:punct:]" " " | cut -d " " -f 5)

# Se crea una lista de nombres aleatorios a partir de el archivo CSV provisto.
NOMBRES=$(sort -R $ARCHIVO_NOMBRES | head -n $1 | cut -d "," -f 1 | cut -d " " -f 1)

# Se borra el directorio temporal en caso de que esté presente.
rm -r $DIR_TEMPORAL 2> /dev/null

# Se crea un directorio temporal para guardar las imágenes.
mkdir $DIR_TEMPORAL

# Se descargan las imágenes, asignándoseles un nombre de la lista de nombres.
CONT=0
for NOMBRE in $NOMBRES; do
	wget -O "$DIR_TEMPORAL/$NOMBRE.$FORMATO" $LINK 2> /dev/null
	CONT=$((CONT + 1))
	echo "Generando imágenes... ($CONT/$1)"
	sleep 1
done

echo "Imágenes generadas. Comprimiendo..."

# Se comprimen las imágenes.
tar -C $DIR_TEMPORAL -czf $ARCHIVO_SALIDA ./

# Se calcula la suma de verificación y se guarda en un archivo.
echo $(sha256sum $ARCHIVO_SALIDA) > $ARCHIVO_SALIDA.sha256

# Se borra el directorio temporal.
rm -r $DIR_TEMPORAL

echo "Imágenes generadas y comprimidas en '$ARCHIVO_SALIDA'"
read -p "Presione Enter para continuar..."