#!/bin/bash
#autor: Esteban
#Verifica la existencia de un archivo 
#Retorna 0 si numero invalido de argumentos o es nulo (tipo "")
#Retorna 1 si existe
#Retorna 2 no existe
Comando="verifica_existencia"
Sintaxis="Use: $Comando  <pathname>"

#valor retorno
vr=0

if [ ${#} -ne 1 ]
then
	vr=0
else if [ ! -e "${1}" ]
	then
		vr=2
	else
		vr=1
	fi
fi

echo "$Comando retorna $vr"
