#!/bin/bash
#autor: Esteban
#muestra por pantalla y/o  graba en archivo.
#si archivo no existe lo crea y si existe AGREGA.
#primer parametro: [-p -l -t ]( esto es pantalla, log, todo ).
#-p : emite por Pantalla.
#-l : solo graba en Log (archivo).
#-t : Todo (envia a pantalla y graba en archivo).
#----------
#segundo parametro: destino y archivo donde grabar.
#tercer parametro:mensaje.
#cuarto parametro (opcional):tipo mensaje.
#Se implementa con LOGUEP. 
#Nota:esta version del comando incorpora por defecto flag -e para echo.

comando=emitir.sh
sintaxis="Use:comando: $comando [-p -l -t ] <pathname> <mensaje> [tipomensaje]"
retorno=1 		#error por defecto.
log_activado=1 		#desactivado por defecto.
pantalla_activada=1 #desactivada por defecto, se obliga a un flag en comando


#lt:menor que
if [ $# -lt 2 ] || [ $# -gt 4 ]
then
	logep.sh "$comando" "$sintaxis" "ERR"
	exit $retorno
fi
#si el log es activado o pantalla activada
if [ "$1" = -l ] 
then
	log_activado=0
fi

if [ "$1" = -p ]
then
	pantalla_activada=0
fi

if [ "$1" = -t ]
then
	log_activado=0
	pantalla_activada=0
else
	#si llega a esta instancia el parametro es incorrecto
	if [ $pantalla_activada -eq 1 ] && [ $log_activado -eq 1 ] && [ $pant_act_con_parametro -eq 1 ]
	then
		logep.sh "$comando" "$sintaxis" "ERR"
		exit $retorno
	fi
fi
#caso solo por pantalla

if [ $pantalla_activada -eq 0 ]
then
	
	#si hay o no parametro Tipo de mensaje
	# caso 3  parametros
	# si es 2 solo mensaje por pantalla
	if [ $# -eq 2 ] 
	then
		echo -e "$3"
	else
		echo -e "$4" ": " "$3"
	fi
	
fi

#fin solo pantalla
#caso se grabe en log

if [ $log_activado -eq 0 ]
then
	mensaje="$3"
	tipomensaje="$4"
	pathname="$2"
	logep.sh  "$pathname" "$mensaje" "$tipomensaje"
	retorno=$?
fi
exit $retorno
