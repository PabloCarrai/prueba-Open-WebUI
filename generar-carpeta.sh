#!/bin/bash

CARPETA="./data/open-webui"

if [ -d $CARPETA ]; then
    echo "La carpeta existe."
    echo "No hacemos nada.
else
    echo "La carpeta NO existe."
    echo "la creamos"
    mkdir -p $CARPETA 
    chmod -R 777 $CARPETA
fi
