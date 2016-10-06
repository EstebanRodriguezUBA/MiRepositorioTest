#!/bin/bash
#autor: Esteban
comando=inicializar_initep.sh
sistema_iniciado=1 #supongo sistema no iniciado
#cadena vacia


if [ -z "$AMBIENTE_INICIADO" ] || [ "$AMBIENTE_INICIADO" = NO ]
then
	 
	 
	 #no esta iniciado
	 #controlo tambien si no esta instalado al no existir Instalep.conf
	 
		
	 #rutaorigen="$../dirconf"
	 #arch_conf="Instalep.conf"
	 #if [ -e "$rutaorigen/$arch_conf" ]
	 #then
			#. setear_Variables.sh "$rutaorigen" "$arch_conf"
			sistema_iniciado=0
	 #else
		#echo $comando "Sistema EPLAM no instalado" "ERR"
		#emitir.sh -p $comando "Sistema EPLAM no instalado" "ERR"
		#sistema_iniciado=1
	 #fi
else 
	if [ "$AMBIENTE_INICIADO" = SI ]
	then
		#en este caso el Path tendria que estar cargado la ruta a DIRBIN
		mensaje="Ambiente ya inicializado, para reiniciar termine la sesión e ingrese nuevamente" 
		emitir.sh -t $comando "$mensaje" "INFO" 
		sistema_iniciado=1 #abortar proceso entonces 
		
	fi
	
fi

declare -i nro=0

ruta="${GRUPO}/${DIRBIN}"

permisos_fallaron=0 #0: por defecto hay problemas de permisos con archivos
 

if [ $sistema_iniciado -eq 0 ] 
then

      listado=$( ls "$ruta" ) 
      if [ -n "$listado" ]
      then
		#-----------si hay archivos en carpeta
		item=''
		for item in $listado
		do
			if [ -f "${item[$nro]}" ] && [ ! -x "${item[$nro]}" }
			then

				rutaFile="${ruta}/${item[$nro]}"
				echo "$rutaFile"

				chmod +x "$rutaFile"
				error=$?
				if [ $error -ne 0 ]
				then
					emitir.sh -t $comando "Permiso ejecucion: archivo $rutaFile" "ERR"
					permisos_fallaron=0
				fi

			fi
			resultado=$(( nro+=1 ))
		done
     	#-------------------------------------------
       else
			# no hay ficheros
			permisos_fallaron=1
       fi
	
fi

codestatus=1 #1:indica no iniciar demonio; 0: si iniciar demonio
if [ $permisos_fallaron -eq 1 ] && [ $sistema_iniciado -eq 0 ]
then
	emitir.sh -t $comando "Estado del Sistema: INICIALIZADO" "INFO"
	emitir.sh -t $comando "Desea efectuar la activacion de Demonep? Si – No" "INFO"
	codestatus=2
	while [ $codestatus -gt 1 ]
	do
		read eleccion 
		respuesta_usuario.sh "$eleccion"
		codestatus=$?
	done

	#-----------DEMONIO
	if [ $codestatus -eq 0 ]
	then
          demonep.sh &
	fi

	#------------------
fi

