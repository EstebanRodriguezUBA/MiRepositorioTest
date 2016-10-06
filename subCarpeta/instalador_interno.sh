#!/bin/bash
#autor: Esteban
# organiza los scripts implementados para la instalacion del sistema

#detalles del ambiente de desarrollo
 . detalles.sh

#declarando variables y mensajes utiles
#. iniVariablesLocales.sh

#iniciando instalacion verificando existencia instalep.conf
#para testing: codestatus=1
 
 . inicia_verifica_instalacion.sh
#retorno de este script indica si continua o no la instalacion
#-----------------------------------------------------------
saliendo=1 #0:exito. Ya existe instalep.conf
iniciando_instalacion=1 #0:exito. se procede instalacion
comando=instalador_interno.sh

if [ $codestatus -eq 1 ]
then
	saliendo=0
	rutaorigen="${PWD}/dirconf"
	arch_conf="Instalep.conf"
	if [ -e "$rutaorigen/$arch_conf" ]
	then
		 . setear_Variables.sh "$rutaorigen" "$arch_conf"
		 mostrar_Instalacion.sh
	fi
	
	
else
	#declarando variables y mensajes utiles
	. iniVariablesLocales.sh

	#inicia menu de directorios configurable

	while [ "$saliendo" -eq 1 ]
	do
		. menuDirectorios.sh

		mostrar_Instalacion.sh
		mensaje_instalacion="Estado de la instalacion: LISTA\nDesea continuar con la instalacion? (Si- No)"
		emitir.sh -t $comando "$mensaje_instalacion" ""

		#PREGUNTA USUARIO CONTINUAR INSTALACION
		incorrecto=2
		while [ "$incorrecto" -ge 2 ]
		do
		 	read lectura
                	#grabando respuesta usuario
                	emitir.sh -p $comando "$lectura" "INFO" 
                	#---
			respuesta_usuario.sh "$lectura"
			incorrecto=$?
			#echo "el valor incorrecto es $incorrecto"
		done


		saliendo=0 # finaliza bucle que retorna a menu sin importar confirmacion siguiente
		#CONFIRMANDO INSTALACION. sino va a FIN
		if [ "$incorrecto" -eq 0 ]
		then
			emitir.sh -p $comando "Iniciando Instalacion. Esta Ud. seguro? (Si-No)" ""

			incorrecto=2 #cero SI uno NO otro ERROR
			while [ "$incorrecto" -ge 2 ]
                	do
                        	read lectura
                        	#grabando respuesta usuario
                        	emitir.sh -p $comando "$lectura" "INFO"
                        	#---
                        	respuesta_usuario.sh "$lectura"
                        	incorrecto=$?
                	done

			if [ "$incorrecto" -eq 0 ]
			then
				iniciando_instalacion=0
			fi
		fi
		#--------FIN CONFIRMACION INSTALACION
	done
fi

if [ $iniciando_instalacion -eq 0 ]
then
	#backup
	respaldar.sh "${GRUPO}" "backup" "$( ls ${GRUPO} )"
	#------
	crear_estructuras_directorio.sh
	configurar_sistema.sh
	#seteo variable path
	PATH=$PATH:"${GRUPO}"
	PATH=$PATH:"${GRUPO}/$DIRBIN"
	
	mover_archivos_utiles.sh
	#nueva ubicacion
	emitir.sh -t $comando "Instalacion CONCLUIDA." "INFO"
	emitir.sh -t $comando "Fin del proceso. Usuario:$LOGNAME  Fecha y Hora :$(date)" "INFO"

fi
