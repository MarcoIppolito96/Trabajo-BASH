#!/bin/bash
if [[ $# != 1 ]]; then
	echo "Numero de argumentos incorrecto, debe usar solo uno"
	exit 1
fi

mkdir itmp

sort -R personas.csv | cut -d "," -f 1 | head -n $1 > nombres

#for $(seq $1); do

#wget -P itmp URL_archivo
#sleep 5

#done

for file in imagen*; do
	read line
	mv "${file}" "${line}"
done < nombres

