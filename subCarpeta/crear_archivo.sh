#!/bin/bash
#autor: Esteban
#crear archivo con parametros de permisos de ejecucion
#si ya existe los sobreescribe ***por ahora es asi***
#primer parametro: permisos
#segundo parametro:pathname
sintaxis="Use: $0 [permisos-entrecomillado todo] [pathname]" 
retorno=1
comando=$0
#flag para  desactivar mensajes en pantalla de errores
activada_stderr=1  # Este valor modificable por una variable exportada consultar.
basura_stderr="/dev/null"
status_stderr=1
#****************

if [ $# -eq 2 ]
then

	#si desactivo mensajes error por pantalla
	if [ $activada_stderr -eq 1 ]
	then 
		> "$2"
        	chmod "$1" "$2" 2>> $basura_stderr
		status_stderr=$?
	else 
	 	chmod "$1" "$2"
		status_stderr=$?
	fi
	retorno=$status_stderr
fi

mensaje="permisos: $1 pathname: $2"

if [ $retorno -ne 0 ]
then
	emitir.sh -t $comando "$sintaxis" "ERR"
	#echo $mensaje
else
	emitir.sh -t $comando "Archivo creado" "INFO"
	#echo $mensaje
fi
exit $retorno
