#!/bin/bash
#autor: Esteban
#mueve archivo/s 
#sintaxis: Movep <origenPathname> <destinoPathname>
function Movep
{

sintaxis="USE: Movep <origenPathname> <destinoPathname>"
origen="$1"
destino="$2"
#comandoQueInvoca="$0"

#echo " Comando que invoca: $comandoQueInvoca"

item=" "

for item in $origen
do
	if [ -f "$item" ]
	then
		#para pruebas
		#cp -v "$item" "$destino"
		
 
		mv "$item" "$destino" 2>> /dev/null
	fi
done
return
}

