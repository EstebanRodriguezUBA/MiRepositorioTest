#!/bin/bash
#autor : Esteban
#Menu directorio a ingresar espera una opcion:
# retorna respuesta segun opcion
# grabar en log  mensaje usando LOGEP
comando=menuDirectorios.sh
opcion="."

# ------------
#. iniVariablesLocales.sh



# presentacion
#. detalles.sh

while [ "$opcion" != 9 ]
do

	# presentacion
	#. detalles.sh
	#-------------
	echo "***Definicion de directorios***"
	echo
	echo "$_msg_defina_dir :"
	echo "1_  $_msg_bin ($GRUPO/$DIRBIN)."
	echo "2_  $_msg_mae ($GRUPO/$DIRMAE)."
	echo "3_  $_msg_rec ($GRUPO/$DIRREC)."
	echo "4_  $_msg_ok ($GRUPO/$DIROK)."
	echo "5_  $_msg_proc ($GRUPO/$DIRPROC)."
	echo "6_  $_msg_info ($GRUPO/$DIRINFO)."
 	echo "7_  $_msg_log ($GRUPO/$DIRLOG)."
	echo "8_  $_msg_nok ($GRUPO/$DIRNOK)."
	echo
	echo "9_  Terminar"
	echo
	echo "Ingrese una opcion: "

	read opcion
	emitir.sh -p $comando "Respuesta usuario: $opcion" "INFO"
	#si no es cadena vacia y  es un numero del 1 al 9
	if [ ! -z "$opcion" ] && ( echo "$opcion"| grep [1-9] )
	then
		if [ "$opcion" -ne 9 ]
		then
			. modificar_directorio.sh "$opcion"
			#definir espacio archivo de novedades
			if [ "$opcion" -eq 3 ]
			then
				. determinar_espacio.sh
			fi
		else
			echo "FIN"
		fi
	else 
 	 	emitir.sh -t $comando "Opcion:no valida." "ERR"
  	fi

	sleep 1
done
codestatus=0
#exit $codestatus
