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

# Se intenta descomprimir el archivo asumiendo que es un tar comprimido.
7zz x -so $IMAGENES 2> /dev/null | tar -C $DIR_TEMPORAL -xf - 2> /dev/null ||

# Si lo anterior falla, se intenta descomprimirlo como un archivo comprimido
# con otro formato de compresión.
7zz x $IMAGENES -o$DIR_TEMPORAL &> /dev/null ||

# Si todo lo anterior falla, se vuelve al menú. 
{
    echo "El archivo no se pudo descomprimir."
    read -p "Presione Enter para volver al menú."
    exit 2
}

echo "Imágenes descomprimidas."