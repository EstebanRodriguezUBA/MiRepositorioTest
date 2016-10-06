#!/bin/bash
#remueve permiso ejecucion - para test
#si longitud parametro es distinta de cero  entonces ejecutar,sino no nada
if [ -n "$1" ]
then
	ls -l $1
	chmod -x $1
	ls -l $1 | more
fi

