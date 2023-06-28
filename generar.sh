#!/bin/bash
if [[ #? != 1]]; then
	echo "Numero de argumentos incorrecto, debe usar solo uno."
	exit 1
fi

mkdir itpm


for $(seq $1); do

wget -P itmp -O $1 URL_archivo
sleep 5



done
