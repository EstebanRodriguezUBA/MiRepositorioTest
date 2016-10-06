#!/bin/bash
#autor: Esteban
#Este comando crea carpeta de resguardo de archivos originales y los copia

comando=$0

sintaxis="USE:Comando:$0 <path> <folder> <lista archivos>"

folder="$1/$2"

mkdir "$folder" 2> /dev/null

#resultado=$( ls "${GRUPO}" )
valor=" "
#OJO no es lo mismo for valor in lista  QUE for valor in ! 
#OJO no es lo mismo "$3" que $3

for valor in $3
do
#	if [ ! -d "$valor" ]
#	then
#		echo "Esto no es un directorio: $valor "
#	fi

	if [ -f "$valor" ]
	then
#		echo "Es un archivo: $valor"
		cp  "$valor" "$folder"
	fi
#	if [ -d "$valor" ]
#	then
#		echo "DIRECTORIO:$valor"
#	fi
done
echo "FIN backup... "

exit 0
