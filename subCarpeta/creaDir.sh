#! /bin/bash
# autor: Esteban
# crea directorio.
# retorna 0: exito.
# retorna 1: error.
# retorna 3: existe directorio.
# retorna 4: faltan argumentos.
# creadir [-l]  <pathname>
# -l	: activa la grabacion en log.
#*****************
#flag para  desactivar mensajes en pantalla de errores
activada_stderr=1  # Este valor modificable por una variable exportada consultar.
basura_stderr="/dev/null"
status_stderr=1
#*****************
retorno=1  # valor retorno
Comando=$0
Opcion=$1
Dir=$2
log_Activado=1 # 0:activado 1:no activado

mensajeEstado="Comando:$Comando ; Opcion:$1 ; Directorio:$2 ; LogActivado:$log_Activado ;"
mensaje="Use: $Comando [-l] <pathname>"


#-----
if [ $# -eq 2 ] && [ "$Opcion" = -l ]; then
	log_Activado=0
	retorno=0 
#si solo hay un parametro tiene que ser el  pathname
else 
	if [ $# -eq 1 ]
	then
		Opcion=""
		Dir=$1
		#si es una cadena vacia
		if [ -z "$Dir" ]; then
			retorno=4
		else
			retorno=0
		fi
	fi
fi
#-----
#si no hubo error hasta esta linea verificar si existe directorio

if [ $retorno -eq 0  ]; then
	#---
	if [ ! -d "$Dir" ]; then
		#si desactivo mensajes error por pantalla
		# -p: para directorios anidados
		if [ $activada_stderr -eq 1 ];then
			mkdir -p "$Dir" 2>> $basura_stderr
			status_stderr=$?
		else 
			mkdir -p "$Dir"
			status_stderr=$?
		fi

		retorno=$status_stderr

		#--
		if [ $retorno -eq 0 ]; then 
			mensaje="$Dir ha sido creado..."
		else
			mensaje="Error: Directorio no valido."
		fi
		#--
	else
		mensaje="Ya existe"
		retorno=3
	fi
	#---
fi

#-----

if [ $log_Activado -eq 1 ]
then
	emitir.sh -p $Comando "$mensajeEstado -- $mensaje" "INFO"
else
	emitir.sh -t $Comando "$mensajeEstado -- $mensaje" "RUTALOG" "INFO"
fi

exit $retorno
