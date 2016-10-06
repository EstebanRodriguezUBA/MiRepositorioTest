#!/bin/bash
#autor : Esteban
#mueve a las carpetas correspondientes
#archivos de log son creados durante la instalacion previos a la creacion
#de la estructura. son movidos a la carpeta definitiva definida por 
#DIRLOG. la carpeta donde se guardaban es dirconf q es palabra reservada
comando="mover_Archivos_utiles.sh"
. funcion_mover.sh

emitir.sh -t $comando "Instalando Programas y Funciones" ""


#moviendo archivos de log que se hayan creado durante la instalacion que estaban en carpeta
#temporal, ya que si el usuario cambio el nombre se evalua

if [ "${DIRLOG}" != "log" ]
then
	if [ -d "${GRUPO}/log" ]
	then
		origen=$(ls ${GRUPO}/log/*.log) #varios casos se contemplan 
		destino="${GRUPO}/$DIRLOG"
		Movep "$origen" "$destino" "$comando"
		
	fi
fi


#---------------------------------------------------
emitir.sh -t $comando "Instalando Archivos Maestros y tablas" "INFO"

#se modifica la carpeta agrupados los archivos mae en una subcarpeta
origen=$(ls ${GRUPO}/datos/*.csv)
destino="${GRUPO}/$DIRMAE"

Movep "$origen" "$destino" "$0"

#nota:no expande con entrecomillado
origen=$(ls ${GRUPO}/*.sh) 
destino="${GRUPO}/$DIRBIN"

Movep "$origen" "$destino" "$comando"

  
