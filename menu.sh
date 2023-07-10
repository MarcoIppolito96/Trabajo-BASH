#!/bin/bash
imprimir_menu() {
    clear
    echo "| = = = = = | Procesador de imágenes | = = = = = |"
    echo ""
    echo "1) Generar imágenes"
    echo "2) Descargar imágenes"
    echo "3) Descomprimir, procesar y comprimir las imágenes"
    echo "0) Salir"
    echo ""
}

opciones() {
    case $1 in
    1)
        clear
        read -p "Ingrese la cantidad de imágenes a generar. Ingrese 0 para volver al menú: " CANT
        while ! [[ $CANT =~ ^[0-9]+$ ]]; do
            clear
            read -p "Cantidad incorrecta. Intente nuevamente: " CANT
        done
        ./generar.sh $CANT
        main
    ;;
    2)
        ./descargar.sh
        main
    ;;
    3)
        ./descomprimir.sh || main
        ./procesar.sh || main
        ./comprimir.sh
        main
    ;;
    0)
        exit 0
    ;;
    esac
}

leer_opcion() {
    read -p "Ingrese una opción: " OPCION
    while ! [[ $OPCION =~ ^[0-3]$ ]]; do
        imprimir_menu
        read -p "Opción incorrecta. Intente nuevamente: " OPCION
    done
    opciones $OPCION
}

main() {
    imprimir_menu
    leer_opcion
}

main