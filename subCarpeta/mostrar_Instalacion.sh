#!/bin/bash
#autor : Esteban
#muestra configuracion de instalacion
#Atencion : estoy suponiendo que los directorios no se borran adrede 
#TEMPORAL sini va grupo**************
#Mensajes emitidos para directorios
comando=mostrar_instalacion.sh

_msg_bin="Ejecutables"
_msg_mae="Maestros y tablas"
_msg_rec="Recepcion de novedades"
_msg_ok="Archivos Aceptados"
_msg_proc="Archivos Procesados"
_msg_info="Archivos de Reportes"
_msg_log="Archivos de Log"
_msg_nok="Archivos Rechazados"


ruta="${GRUPO}"

ruta_dir="$ruta"
#TEMPORAL ***********************

directorio_de="Directorio de "
dir_mostrado="***Directorios***\n"

dir_mostrado+="$directorio_de $_DIR_RESERVADO\n"

#mostrar contenido de directorios
ruta_dir="$ruta/$_DIR_RESERVADO"
dir_mostrado+="path: $ruta_dir\n"
dir_mostrado+=$( ls -l  "$ruta_dir" 2>> /dev/null )
dir_mostrado+="\n"
#--------------------------------

dir_mostrado+=$directorio_de$_msg_bin"\n"

#mostrar contenido de directorios
ruta_dir="$ruta/$DIRBIN"
dir_mostrado+="path: $ruta_dir\n"
dir_mostrado+=$( ls -l $ruta_dir 2>> /dev/null)
dir_mostrado+="\n"
#--------------------------------

dir_mostrado+=$directorio_de$_msg_mae"\n"

#mostrar contenido de directorios
ruta_dir="$ruta/$DIRMAE"
dir_mostrado+="path: $ruta_dir\n"
dir_mostrado+=$( ls -l $ruta_dir 2>> /dev/null)
dir_mostrado+="\n"
#--------------------------------

dir_mostrado+=$directorio_de$_msg_rec"\n"

ruta_dir="$ruta/$DIRREC"
dir_mostrado+="path: $ruta_dir\n"

dir_mostrado+=$directorio_de$_msg_ok"\n"

ruta_dir="$ruta/$DIROK"
dir_mostrado+="path: $ruta_dir\n"

dir_mostrado+=$directorio_de$_msg_proc"\n"

ruta_dir="$ruta/$DIRPROC"
dir_mostrado+="path: $ruta_dir\n"

dir_mostrado+=$directorio_de$_msg_log"\n"

ruta_dir="$ruta/$DIRLOG"
dir_mostrado+="path: $ruta_dir\n"

dir_mostrado+=$directorio_de$_msg_nok"\n"

ruta_dir="$ruta/$DIRNOK"
dir_mostrado+="path: $ruta_dir\n"

listado=$dir_mostrado


#limpieza pantalla
clear 

emitir.sh -t $comando "$listado" ""

