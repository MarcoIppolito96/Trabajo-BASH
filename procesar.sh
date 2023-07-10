#!/bin/bash
# Se comprueba que exista el directorio temporal donde se almacenan las
# imágenes descomprimidas.
if ! [[ -d $DIR_TEMPORAL ]]; then
    echo "El directorio '$DIR_TEMPORAL' no se encuentra presente. Primero debe descomprimir las imágenes."
    read -p "Presione Enter para volver al menú."
    exit 1
fi

# Se crea una lista con los nombres de archivos válidos (comienzan con
# mayúscula y continúan con minúscula).
VALIDOS=$(ls $DIR_TEMPORAL | grep -E ^[[:upper:]][[:lower:]]+\.?[[:alpha:]]+$)
CANT=$(echo $VALIDOS | wc -w)

# Se procesan las imágenes con nombres válidos.
CONT=1
for NOMBRE in $VALIDOS; do
    echo "Procesando imágenes... ($CONT/$CANT)"
    convert "$DIR_TEMPORAL/$NOMBRE" -gravity center -resize 512x512+0+0 -extent 512x512 "$DIR_TEMPORAL/$NOMBRE" 2> /dev/null
    CONT=$(($CONT + 1))
done

echo "Imágenes procesadas."