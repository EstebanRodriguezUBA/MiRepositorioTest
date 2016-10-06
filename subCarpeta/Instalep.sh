#! /bin/bash
# autor: Esteban
#Inicializa instalacion del sistema EPLAM
#Por parametro se pasa la ruta equivalente $GRUPO, es decir
#dentro de la carpeta Grupo11
#si no se pasa ningun parametro significa que se está ejecutando desde esta carpeta
	
	#acomodado para uso por logep.sh durante instalacion segun esta implementado
	
	if [ -z "$1" ]
	then
		GRUPO=${PWD}
	else
		GRUPO="$1"
	fi
	PATH=$PATH:${GRUPO}
	export GRUPO
	creaDir.sh  "${GRUPO}/log"
	export DIRLOG="log"
	#-------------
	instalador_interno.sh
 
