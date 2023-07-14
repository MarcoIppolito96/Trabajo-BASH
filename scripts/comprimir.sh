#!/bin/bash
# Se comprueba que exista el directorio temporal donde se almacenan las
# imágenes procesadas.
if ! [[ -d $DIR_TEMPORAL ]]; then
    echo "El directorio '$DIR_TEMPORAL' no se encuentra presente. Primero debe descomprimir y procesar las imágenes."
    read -p "Presione Enter para volver al menú."
    exit 1
fi

# Se crea una lista con los nombres de las imágenes.
NOMBRES=$(ls $DIR_TEMPORAL)

# Se inicia el contador de imágenes que terminan con 'a'.
CONT=0

for NOMBRE in $NOMBRES; do
    # Se agrega cada nombre a la lista de nombres de todas las imágenes.
    echo $NOMBRE >> "$DIR_TEMPORAL/lista_nombres.txt"

    # Se comprueba si el nombre es válido y, de serlo, lo agrega a la lista de
    # nombres válidos.
    if [[ $NOMBRE =~ ^[[:upper:]][[:lower:]]+\.?[[:alpha:]]+?$ ]]; then
        echo $NOMBRE >> "$DIR_TEMPORAL/lista_nombres_validos.txt"
    fi

    # Se comprueba si el nombre termina con 'a' y, de hacerlo, suma 1 al
    # contador.
    if [[ $NOMBRE =~ .*a\.?[[:alpha:]]+?$ ]]; then
        CONT=$(($CONT + 1))
    fi
done

# Se escribe la cantidad de nombres que terminan con 'a'.
echo $CONT > "$DIR_TEMPORAL/terminan_con_a.txt"

echo "Comprimiendo las imágenes..."

# Se comprimen todos los archivos generados y todas las imágenes en el
# directorio de salida, el cual es accesible fuera del contenedor.
tar -C $DIR_TEMPORAL -czf "$DIR_SALIDA/salida.tar.gz" ./

# Se borra el directorio temporal.
rm -r $DIR_TEMPORAL

echo "Las imágenes fueron comprimidas. El archivo de salida se encuentra en la carpeta 'salida'."
read -p "Presione Enter para volver al menú."
