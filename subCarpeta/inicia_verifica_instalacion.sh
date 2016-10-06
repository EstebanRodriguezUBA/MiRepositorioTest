#! /bin/bash
# autor: Esteban
#Inicializa instalacion verificando si hay instalacion previa

#comando=$0
comando=inicia_verifica_instalacion.sh
#----------------opcional---------
echo "Pulse enter para continuar"

read pressanykeytocontinue

clear
#----------------------------------

emitir.sh -t $comando "Inicio del proceso. Usuario:$LOGNAME  Fecha y Hora :$(date)" "INFO"

emitir.sh -t  $comando "Verificando instalacion previa..." "INFO"

codestatus=0 #0:indica que no hay instalacion previa

ruta_configuracion="${GRUPO}/dirconf"
archivo_configuracion="Instalep.conf"

if [ -f "$ruta_configuracion/$archivo_configuracion" ]
then
	codestatus=1 #Si existe archivo entonces, ya fue instalado sistema
	emitir.sh -t $comando "Ya existe el archivo de configuracion $archivo_configuracion ..." "INFO"
	emitir.sh -t  $comando "Mostrando configuracion de la instalacion..." "INFO"

fi
