#!/bin/bash

#   Ruta de la carpeta necesaria
CARPETA="./data/open-webui"
#   Verificacion de permisos sobre dicha carpeta
PERMISOS=$(stat -c "%a" "$CARPETA" 2>/dev/null)

#   Necesitamos permisos de sudo 
if [ "$EUID" -ne 0 ]; then
    echo "No tienes permisos de sudo"
    exit 1
else
    if [ -d $CARPETA ]; then
        #   Si la carpeta existe verifiamos los permisos
        echo "La carpeta existe."
        echo "No hacemos nada.
        if [ "$PERMISOS" = "777" ]; then
            echo "Tenemos los permisos necesarios"
        else
            #   Si no tenemos los permisos necesarios los aplicamos
            echo "Nos faltan los permisos, los aplicamos"
            chmod -R 777 $CARPETA
        fi
    else
        #   Si la carpeta no existe la creo y aplico permisos
        echo "La carpeta NO existe."
        echo "la creamos"
        mkdir -p $CARPETA 
        chmod -R 777 $CARPETA
    fi
fi

