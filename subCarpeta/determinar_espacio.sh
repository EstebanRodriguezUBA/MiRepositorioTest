#!/bin/bash
#autor: Esteban
comando=determinar_espacio.sh

sintaxis="USE:comando $0"
eleccion=""
terminar=1 #0:exito
espacio_requerido=$DATASIZE
modificar=1 #0:exito. si modificar.
while [ $terminar -eq 1 ]
do 

	emitir.sh -t $comando "Defina espacio mínimo libre para la recepción de archivos en Mbytes ($espacio_requerido)" 
	emitir.sh -t $comando "Modificar (Si/No)?" ""
	read eleccion
	#./emitir.sh -t "la eleccion es $eleccion..."

	if [ "$eleccion" = S ] || [ "$eleccion" = s ] || [ "$eleccion" = "Si" ]
	then
		modificar=0
		terminar=0
	else 
		if [ "$eleccion" = N ] || [ "$eleccion" = n ] || [ "$eleccion" = "No" ]
		then
			modificar=1
			terminar=0
		else
			emitir.sh -t $comando "Ingreso no valido." "ERR"

		fi
	fi
done

if [ $modificar -eq 0 ]
then
	. consultar_espacio.sh $espacio_requerido #si no es con source no actualizo valor variable DATASIZE

fi
