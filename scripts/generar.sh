#!/bin/bash
clear

# Se comprueba que se haya pasado sólo un argumento y que dicho argumento sea
# un número mayor a 1.
if [[ $# != 1 ]] || [[ $1 < 1 ]]; then
	exit 1
fi

source link_valido.sh

# Comprueba que el link pasado por argumento funcione correctamente. Si el link
# no funciona, se vuelve al menú.
comprobar_link() {
	if ! link_valido $1; then
		echo "El link '$1' no es válido o no funciona. Cambie el link o intente nuevamente más tarde."
		read -p "Presione Enter para volver al menú."
		exit 2
	fi
}

# Constantes
ARCHIVO_NOMBRES="$DIR_RAIZ/nombres.csv"
LINK_NOMBRES="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"
LINK_IMAGENES="https://thispersondoesnotexist.com/"
comprobar_link $LINK_IMAGENES

# Se descarga el archivo CSV con los nombres en caso de no estar presente.
if ! [[ -f $ARCHIVO_NOMBRES ]]; then
	echo "El archivo con los nombres no se encuentra presente. Descargando..."
	comprobar_link $LINK_NOMBRES
	wget -O $ARCHIVO_NOMBRES $LINK_NOMBRES 2> /dev/null
fi

# Se determina el formato de las imágenes a descargar.
FORMATO=$(wget --spider $LINK_IMAGENES 2>&1 | grep -E ^Length:.*\[image/ |
tr -s "[:punct:]" " " | cut -d " " -f 5)

# Se crea una lista de nombres aleatorios a partir de el archivo CSV provisto.
NOMBRES=$(sort -R $ARCHIVO_NOMBRES | head -n $1 | cut -d "," -f 1 |
cut -d " " -f 1)

# Se borra el directorio temporal en caso de que esté presente.
rm -rf $DIR_TEMPORAL

# Se crea un directorio temporal para guardar las imágenes.
mkdir $DIR_TEMPORAL

# Se descargan las imágenes, asignándoseles un nombre de la lista de nombres.
CONT=1
for NOMBRE in $NOMBRES; do
	echo "Generando imágenes... ($CONT/$1)"
	wget -O "$DIR_TEMPORAL/$NOMBRE.$FORMATO" $LINK_IMAGENES 2> /dev/null
	CONT=$(($CONT + 1))
	sleep 1
done

echo "Imágenes generadas. Comprimiendo..."

# Se comprimen las imágenes.
tar -C $DIR_TEMPORAL -czf $IMAGENES ./

# Se calcula la suma de verificación y se guarda en un archivo.
echo $(sha256sum $IMAGENES) > $SUMA

# Se borra el directorio temporal.
rm -r $DIR_TEMPORAL

echo "Las imágenes fueron generadas y comprimidas exitosamente."
read -p "Presione Enter para volver al menú."
