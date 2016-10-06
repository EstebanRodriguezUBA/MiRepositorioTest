#! /bin/bash
# autor: Esteban
#Grabando configuracion de variables en archivo instalep.conf
comando=configurar_sistema.sh

emitir.sh -p $comando "Actualizando la configuracion del sistema..." "INFO"

registro="[Variables]\n"
#Directorios
 registro="GRUPO\t$GRUPO\n"
registro+="DIRBIN\t$DIRBIN\n"
registro+="DIRMAE\t$DIRMAE\n"
registro+="DIRREC\t$DIRREC\n"
registro+="DIROK\t$DIROK\n"
registro+="DIRPROC\t$DIRPROC\n"
registro+="DIRPROC_proc\t$DIRPROC_proc\n"
registro+="DIRINFO\t$DIRINFO\n"
registro+="DIRLOG\t$DIRLOG\n"
registro+="DIRNOK\t$DIRNOK\n"
registro+="_DIR_RESERVADO\t${_DIR_RESERVADO}\n"  	#palabra reservada
#registro+="DIRREC_ESPACIO\t$DIRREC_ESPACIO\n" 	#respaldo valor original de espacio asignado Dirrec
registro+="DATASIZE\t$DATASIZE\n"		#modificable por usuario
registro+="AMBIENTE_INICIADO\t$AMBIENTE_INICIADO\n"

#TEMPORAL evaluacion
echo -e "$registro"  >> "${_DIR_RESERVADO}/Instalep.conf"
#----------------------------------------------------
emitir.sh -l $comando "$registro :destino = ${_DIR_RESERVADO}/Instalep.conf" "INFO"

