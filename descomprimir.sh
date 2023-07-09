#!/bin/bash
clear

# Se comprueba que exista el archivo que contiene las imágenes.
if ! [[ -f $IMAGENES ]]; then
    echo "El archivo '$IMAGENES' no se encuentra presente. Intente descargarlo o generarlo nuevamente."
    read -p "Presione Enter para volver al menú."
    exit 1
fi

# Se borra el directorio temporal en caso de que esté presente.
rm -rf $DIR_TEMPORAL

# Se crea un directorio temporal para guardar las imágenes.
mkdir $DIR_TEMPORAL

# Se descomprimen las imágenes.
7zz x $IMAGENES -o$DIR_TEMPORAL > /dev/null

if [[ $? != 0 ]]; then
    echo "El archivo no se pudo descomprimir."
    read -p "Presione Enter para volver al menú."
    exit 1
fi

# Si el archivo generado/descargado es un .tar.gz, 7-zip sólo extraerá el
# contenido del archivo .gz, por lo que habrá que extraer también el archivo
# .tar que contiene.
if [[ -f "$DIR_TEMPORAL/$IMAGENES~" ]]; then
    7zz x $DIR_TEMPORAL/$IMAGENES~ -o$DIR_TEMPORAL > /dev/null
fi

echo "Imágenes descomprimidas."