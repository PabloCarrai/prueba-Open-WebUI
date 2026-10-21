#!/bin/bash

IP_VM="$1"
ARCHIVO=".env-Ejemplo"
ARCHIVOFINAL=".env"

# Verificar si se pasó la IP
if [ -z "$1" ]; then
  echo "Error: Falta la IP de la ia"
  exit 1
fi


if [ -f "$ARCHIVO" ]; then
    echo "El archivo existe"
    echo "Procedemos con los cambios"
    # Reemplaza la cadena exacta en el archivo
    sed -i "s/<IP_DE_LA_MAQUINA_VIRTUAL>/$IP_VM/g" "$ARCHIVO"
    echo "Archivo $ARCHIVO actualizado con la IP: $IP_VM"
    mv "$ARCHIVO" "$ARCHIVOFINAL"
else
    echo "El archivo no existe"
fi



