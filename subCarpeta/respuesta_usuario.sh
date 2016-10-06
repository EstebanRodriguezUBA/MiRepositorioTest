#!/bin/bash
#autor: Esteban

eleccion="$1"
terminar=2
if [ "$eleccion" = S ] || [ "$eleccion" = s ] || [ "$eleccion" = "Si" ]
then
	terminar=0
else 
	if [ "$eleccion" = N ] || [ "$eleccion" = n ] || [ "$eleccion" = "No" ]
	then
		terminar=1
	else
		emitir.sh -t $0 "Ingreso no valido." ""
		terminar=2
	fi
fi

exit $terminar
