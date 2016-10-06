#!/bin/bash
#autor : Esteban
comando=crear_estructuras_directorio.sh

emitir.sh -t $comando "Creando Estructuras de directorio..." "INFO"


creaDir.sh -l "${GRUPO}/$DIRBIN"

creaDir.sh -l "${GRUPO}/$DIRMAE"

creaDir.sh -l "${GRUPO}/$DIRREC"

creaDir.sh -l "${GRUPO}/$DIROK"

creaDir.sh -l "${GRUPO}/$DIRPROC"

creaDir.sh -l "${GRUPO}/${DIRPROC}/proc"

creaDir.sh -l "${GRUPO}/$DIRLOG"

creaDir.sh -l "${GRUPO}/$DIRNOK"
