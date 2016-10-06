#!/bin/bash
if [ $# -lt 2 ]
then
    echo "Uso: logep COMANDO MENSAJE [tipo de mensaje]"
    exit 1
fi

if [ -z ${DIRLOG} ]
then
    echo "logep: Variable DIRLOG no esta seteada"
    exit 1
fi

WHO=$USER
WHEN=$(date "+%Y-%m-%d %H:%M:%S")
WHERE="$1"
WHY="$2"

if [ $# -gt 2 ]
then
    WHAT="$3 - "
fi
#modificado para que al crear archivo si no existe no pase a stdout

#si existe y es un directorio
if [ -d "${GRUPO}/{DIRLOG}" ]
then
	LOG_FILENAME="$GRUPO/$DIRLOG/$WHERE.log"
else

	tempo="${GRUPO}/log" #esto debido a la creacion temporal de carpeta
	#y que no se modifique durante menu y mande mensajes de error
	LOG_FILENAME="${tempo}/${WHERE}.log"
fi
echo "$WHEN - $WHO - $WHERE - $WHAT$WHY" >> $LOG_FILENAME 2>> /dev/null
LOG_SIZE=$(wc -c < $LOG_FILENAME)
LOG_SIZE=$((LOG_SIZE / 1024))

if [ $LOG_SIZE -gt 500 ]
then
    tail -n 30 $LOG_FILENAME > /tmp/tmp.log
    mv /tmp/tmp.log $LOG_FILENAME
fi
