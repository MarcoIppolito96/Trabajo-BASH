#!/bin/bash
# Comprueba que el link pasado por argumento sea válido.
link_valido() {
    wget --spider $1 &> /dev/null
}
