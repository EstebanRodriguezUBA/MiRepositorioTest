#!/bin/bash
#autor: Esteban
# da permisos ejecucion paso previo a instalacion (nota: permisos a TODOS no solo usuario)
#mostrar previo a dar permisos ejecucion
#si parametro es no nulo entonces ejecutar. si longitud cero no hacer nada.
#NOTA: para todos los archivos en ubicacion actual el parametro es "*.*" 

comando=$0
sintaxis="Use:comando: $0 <pathname>"

retorno="1" #retorno 1 error // 0 exito

#NOTA:si no se pone en comillas en sentencia if a $1, si fuese el caso sin parametros,
#entonces es como pasar NADA, diferente a pasar "".

#*******
activada_stderr=1
basura_stderr="/dev/null"
status_stderr=1
#******* 

if [ -n "$1" ]
then
	if [ $activada_stderr -eq 1 ]
	then
		chmod +x $1 2>> $basura_stderr
		status_stderr=$?
	else
		chmod +x $1
		status_stderr=$?
	fi
	retorno=$status_stderr
fi

exit $retorno



