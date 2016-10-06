#!/bin/bash
#autor: Esteban
#setea las variables para iniciar demonio
#comando=$0
comando=setear_Variables.sh
ruta="$1"
arch_conf="$2"
registro=$( awk '{print $2}' "$1/$2" )


listado=''
IFS='
'
declare -i nro=0

for item in $registro
do
	listado[nro]=$item	
	#./emitir.sh -l $comando "Seteado item nro $nro ${listado[nro]} =  $item" ""
	respuesta=$(( nro += 1 ))
done

export GRUPO=${listado[0]}
export DIRBIN=${listado[1]}
export DIRMAE=${listado[2]}
export DIRREC=${listado[3]}
export DIROK=${listado[4]}
export DIRPROC=${listado[5]}
export DIRPROC_proc=${listado[6]}
export DIRINFO=${listado[7]}
export DIRLOG=${listado[8]}
export DIRNOK=${listado[9]}
export _DIR_RESERVADO=${listado[10]}
export DATASIZE=${listado[11]}
export AMBIENTE_INICIADO=${listado[12]}

#seteo variable path
PATH=$PATH:"${GRUPO}/$DIRBIN"
PATH=$PATH:"${GRUPO}"
#Modifico el estado del  ambiente
AMBIENTE_INICIADO=SI
