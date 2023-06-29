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

opciones() {
    case $1 in
    1)
        clear
        read -p "Ingrese la cantidad de imágenes a generar: " CANT
        while [[ $CANT < 1 ]]; do
            clear
            read -p "Cantidad incorrecta. Intente nuevamente: " CANT
        done
        ./generar.sh $CANT
        menu
        leer_opcion
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
}

leer_opcion() {
    read -p "Ingrese una opción: " OPCION
    while [[ $OPCION < 0 ]] || [[ $OPCION > 3 ]]; do
        menu
        read -p "Opción incorrecta. Intente nuevamente: " OPCION
    done
    opciones $OPCION
}

main() {
    menu
    leer_opcion
}

main