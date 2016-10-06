#!/bin/bash
#autor : Esteban

comando=modificar_directorio.sh
sintaxis="Use: comando $0 [valor numerico]"

opcion_menu=$1
nombre=""
valor_retorno=1


 case $opcion_menu in

	1) nombre="$DIRBIN";;
	2) nombre="$DIRMAE";;
	3) nombre="$DIRREC";;
	4) nombre="$DIROK";;
	5) nombre="$DIRPROC";;
	6) nombre="$DIRINFO";;
	7) nombre="$DIRLOG";;
	8) nombre="$DIRNOK";;
esac

var_opcion="$GRUPO" 	#${lista_Variables[0]}
valor_opcion="$nombre" #${lista_Valvar[$letra]}

mensaje="Desea modificar directorio:(Si/No)?\n ($var_opcion/$valor_opcion)"

emitir.sh -t $comando "$mensaje" ""

letra=""
read letra
#flag para palabra reservada
reservado=1
if [ "$letra" = "S" ] || [ "$letra" = "s" ] || [ "$letra" = "Si" ]
then
	emitir.sh -t $comando "Nuevo nombre... " "INFO"

	read nombre  #si es palabra reservada o vacio
	if [ "$nombre" = "${_DIR_RESERVADO}" ] || [ -z "$nombre" ]
	then
		emitir.sh -t $comando "Palabra reservada: ${_DIR_RESERVADO} - Ingreso vacio" "ERR"
		reservado=0
	fi

	# creo directorio si falla es invalido y si esta bien lo borro 
	# si es valido modifico la variable de ambiente
	if [ $reservado -eq 1 ]
	then
		camino_ingresado="$var_opcion/$nombre"

		emitir.sh -l $comando "Path ingresado: $camino_ingresado..." "INFO"
		sleep 2

		creaDir.sh -l "$nombre"
		valor_retorno=$?
	fi
	if [ $valor_retorno -eq 0 ]
	then
		rmdir -p "$nombre"
	else
		emitir.sh -t $comando "Nombre no valido..." "ERR"
		sleep 2
	fi
fi


#modifico el valor de la variable del  si es correcto
#a la variable aun no exportada y al valor en arreglo

if [ $valor_retorno -eq 0 ]
then
	case $opcion_menu in

        1) DIRBIN="$nombre";;
        2) DIRMAE="$nombre";;
        3) DIRREC="$nombre";;
        4) DIROK="$nombre";;
        5) DIRPROC="$nombre";;
        6) DIRINFO="$nombre";;
        7) DIRLOG="$nombre";;
        8) DIRNOK="$nombre";;
	esac

fi


