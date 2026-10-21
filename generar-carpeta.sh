#!/bin/bash

#   Ruta de la carpeta necesaria
CARPETA="./data/open-webui"
#   Verificacion de permisos sobre dicha carpeta
PERMISOS=$(stat -c "%a" "$CARPETA" 2>/dev/null)

# Vemos si tenemos permisos de sudo
if [ "$EUID" -ne 0 ]; then
    echo "❌ No tienes permisos de sudo"
    exit 1
else
    echo "✅ Permisos de sudo correctos."

    # Vemos si la carpeta existe y si tiene permisos 777
    if [ -d "$CARPETA" ] && [ "$PERMISOS" = "777" ]; then
        echo "✅ La carpeta existe y ya tiene permisos 777. No hacemos nada."
    else
        # Si no existe o no tiene los permisos, la creamos/ajustamos
        echo "⚠️ La carpeta no existe o le faltan permisos. Aplicando configuración..."
        mkdir -p "$CARPETA"
        chmod -R 777 "$CARPETA"
        echo "✅ Carpeta creada y permisos aplicados correctamente."
    fi
fi
