#! /bin/bash
# autor: Esteban
#Inicializa  Variables para ejecucion
comando=iniVariablesLocales.sh

./emitir.sh -t $comando "Definiendo variables..." "INFO"

#path hasta la carpeta del grupo
#PATHGROUP=${PWD%/*}
#FOLDERGROUP=GRUPO11
#--------------------------------
#lista_Variables=(GRUPO DIRBIN DIRMAE DIRREC DIROK DIRPROC DIRINFO DIRLOG DIRNOK)
lista_Valvar=(${PWD} bin mae nov ok imp rep log nok)

#NO EMPLEADO
#Recorrido por inidice de array
#for indice in ${!lista_Variables[*]}
#do
#echo "IND:$indice ,Variable:${lista_Variables[$indice]} Val:${lista_Valvar[$indice]}"
#done
#**********************************************************************
#Directorios
export GRUPO=$PWD
export DIRBIN=bin
export DIRMAE=mae
export DIRREC=nov
export DIROK=ok
export DIRPROC=imp
export DIRPROC_proc=proc
export DIRINFO=rep
export DIRLOG=log
export DIRNOK=nok

export _DIR_RESERVADO=dirconf 	#palabra reservada
export AMBIENTE_INICIADO=NO
export DIRREC_ESPACIO=100 	#respaldo valor original de espacio asignado Dirrec
export DATASIZE=100		#modificable por usuario

#Mensajes emitidos para directorios
_msg_defina_dir="Defina el directorio de"
_msg_bin="Ejecutables"
_msg_mae="Maestros y tablas"
_msg_rec="Recepcion de novedades"
_msg_ok="Archivos Aceptados"
_msg_proc="Archivos Procesados"
_msg_info="Archivos de Reportes"
_msg_log="Archivos de Log"
_msg_nok="Archivos Rechazados"

emitir.sh -t $comando "Fin definicion variables." "INFO"


