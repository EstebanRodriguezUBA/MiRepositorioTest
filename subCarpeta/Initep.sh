#!/bin/bash
# inicializa el sistema
#recibe como parametro el path hasta Grupo11.

#seteo la variable PATH
if [ -z "$AMBIENTE_INICIADO" ] || [ "$AMBIENTE_INICIADO" = NO ]
then
	
	PATH=$PATH:"${PWD}"
fi	
rutaorigen="../dirconf"
arch_conf="Instalep.conf"



total="$rutaorigen/$arch_conf"


if [ -e "$total" ]
then
			. setear_Variables.sh "$rutaorigen" "$arch_conf"
			sistema_iniciado=0
			. inicializar_Initep.sh
 else
		echo $comando "Sistema EPLAM no instalado" "ERR"
		#emitir.sh -p $comando "Sistema EPLAM no instalado" "ERR"
		sistema_iniciado=1
fi

