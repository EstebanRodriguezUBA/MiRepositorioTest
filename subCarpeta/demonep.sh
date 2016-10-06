#!/bin/bash
if [ "$AMBIENTE_INICIADO" != "SI" ]
then
    echo "demonep: Ambiente no inicializado."
    exit
fi

CONTEO=0

while [ 1 ]
do
    logep.sh "DEMONEP" "ciclo nro. $CONTEO"
    CONTEO=$((CONTEO + 1))
    sleep 1m
done
