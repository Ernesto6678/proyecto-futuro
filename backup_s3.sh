#!/bin/bash

BUCKET_NAME="bucket-ernesto-1775268115" 
SOURCE_DIR="$HOME/respaldo_prueba"
BACKUP_FILE="backup_$(date +%F_%H-%M-%S).tar.gz"

echo "--- Iniciando proceso de respaldo para Ernesto ---"

tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .
echo "Archivo comprimido creado: $BACKUP_FILE"

aws s3 cp "$BACKUP_FILE" "s3://$BUCKET_NAME/"

if [ $? -eq 0 ]; then
    echo "¡Respaldo subido exitosamente a la nube de AWS!"
    rm -f "$BACKUP_FILE"
else
    echo "Error: No se pudo completar la subida a S3."
fi

echo "--- Proceso finalizado correctamente ---"
