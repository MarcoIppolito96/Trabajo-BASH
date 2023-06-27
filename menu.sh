#!/bin/bash
menu() {
    clear
    echo "# --------- Procesador de imágenes --------- #"
    echo "1) Generar imágenes."
    echo "2) Descargar imágenes."
    echo "3) Descomprimir."
    echo "0) Salir."
    echo ""
}

menu
read -p "Ingrese una opción: " OPCION
while [[ $OPCION < 0 ]] || [[ $OPCION > 3 ]]; do
    menu
    read -p "Opción incorrecta. Intente nuevamente: " OPCION
done

case $OPCION in
    1)
    ./generar.sh
    ;;
    2)
    ./descargar.sh
    ;;
    3)
    ./descomprimir.sh
    ;;
    0)
    exit 0
    ;;
esac