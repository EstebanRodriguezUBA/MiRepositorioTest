#!/bin/bash
#autor: Esteban
#Nota: evaluo la disponibilidad de espacio en Home/user, no en todo el disco, particion,FS
comando=consultar_espacio.sh
#si modifica valor de espacio
eleccion=""
elegido=1
espacio_disponible=0
espacio_requerido=$1
espacio_requerido=${espacio_requerido:=100}
modificar=0
hay_espacio=1

#***mensajes menu chequeo espacio disco***
#mensaje="1)Ingrese nuevo valor ($espacio_requerido Mb):\n"
#mensaje+="2)cancelar"

_msg_1="Insuficiente espacio en disco."
_msg_2="Espacio disponible (Mb):"
_msg_3="Espacio requerido (Mb):"
_msg_4="Inténtelo nuevamente."

#si hay suficiente espacio, mostrar y grabar en el log
_msg_5="Suficiente espacio en disco."
_msg_6="De enter para continuar."
#***fin mensajes
#_msg_Sin_espacio="$_msg_1 \n $_msg_2 $espacio_disponible \n $_msg_3 $espacio_requerido \n $_msg3 \n $_msg_4"
#_msg_Con_espacio="$_msg_5 \n $_msg_2 $espacio_disponible \n $_msg_3 $espacio_requerido \n $_msg3 \n $_msg_6"
#--------------------------------------------------------------------------


while [ "$modificar" -eq 0 ]
do
	mensaje="1)Defina espacio minimo libre para la recepcion de archivos($espacio_requerido Mbytes):\n2)cancelar"
	emitir.sh -t $comando "$mensaje" ""

	read eleccion

	case $eleccion in
        1)
                emitir.sh -t $comando "Ingrese nuevo valor ($espacio_requerido Mb):" ""
                read espacio_requerido
                #Si no es vacia y  contiene caracteres no numericos,
                #luego de la sustitucion entonces no es un numero
                if [ -z "$espacio_requerido" ] || [[ -n "${espacio_requerido//[0-9]/}" ]]
		then
                        emitir.sh -t $comando "Error: No es un numero! $espacio_requerido" ""
                        espacio_requerido=$DATASIZE #reinicio a valor por defecto
                else
                        elegido=0 #0:exito, es un numero.
                fi
	;;
        2)modificar=1;; # sale bucle
	*)
                emitir.sh -p $comando "Incorrecto: $eleccion" ""
	;;

        esac

	#chequeando espacio
        if [ "$modificar" -eq 0 ] && [ "$elegido" -eq 0 ]
        then

#******************************************************************
#		OLDIFS=${IFS}
#		IFS=' '
		#resultado=$( df -l -m ${HOME} | tail -n1 | sed 's/ /:/g' )
		#espacio calculado en la carpeta del usuario logueado
		#IFS=${OLDIFS}
#------------------------------------------------------------------
		espacio_disponible=$( df -l -m ${HOME} | tail -n1 | awk '{print $4}' )

		#si ocurriese algun error en el filtro  se reinicia a cero

		if [[ -n "${espacio_requerido//[0-9]/}" ]] || [ "$espacio_disponible" -le 0 ]
		then
			espacio_disponible=0
		fi

		calculo=$(( $espacio_disponible - $espacio_requerido ))

#******************************************************************

		if [ "$calculo" -gt 0 ]
                then
			hay_espacio=0
                        modificar=1 #sale bucle while
			_msg_Con_espacio="$_msg_5 \n$_msg_2 $espacio_disponible \n$_msg_3 $espacio_requerido \n$_msg3 \n$_msg_6"

			emitir.sh -t $comando "$_msg_Con_espacio" ""
                        read pulsar_enter_para_continuar
                else
                        hay_espacio=1
			_msg_Sin_espacio="$_msg_1 \n$_msg_2 $espacio_disponible \n$_msg_3 $espacio_requerido \n$_msg3 \n$_msg_4"

                        emitir.sh -t $comando "$_msg_Sin_espacio" ""
                        read pulse_enter_para_continuar
                fi
        fi

done
#actualizo variable exportada
if [ "$hay_espacio" -eq 0 ]
then
	DATASIZE=$espacio_requerido
fi
