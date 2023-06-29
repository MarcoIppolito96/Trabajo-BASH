#!/bin/bash
if [[ $# != 1 ]]; then
	exit 1
fi

# Se crea una lista de nombres a partir de el archivo CSV provisto.
NOMBRES=$(sort -R personas.csv | head -n $1 | cut -d "," -f 1 | tr " " _)

# Se crea un directorio temporal para guardar las imágenes.
mkdir tmp 2> /dev/null

CONT=0
for nombre in $NOMBRES; do
	wget -O tmp/$nombre.jpg https://thispersondoesnotexist.com/ 2> /dev/null
	CONT=$((CONT + 1))
	echo "Generando imágenes... ($CONT/$1)"
	sleep 1
done