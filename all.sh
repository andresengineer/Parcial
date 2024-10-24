#!/usr/bin/env bash
#
# Este script se encarga de invocar los tres programas que permiten la 
# conversión de cada imagen JPG en la carpeta raíz a una secuencia de píxeles,
# procesar esos píxeles, y luego convertir esa secuencia en un archivo PNG.
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2024-08-22
#

# Procesar todas las imágenes JPG en la carpeta actual
for INPUT_JPG in *.jpg; do
    # Generar el nombre del archivo temporal basado en la imagen
    TEMP_FILE="${INPUT_JPG%.*}.bin"

    echo "Procesando $INPUT_JPG..."

    # Convertir de JPG a binario
    python3 fromPNG2Bin.py "${INPUT_JPG}"

    # Ejecutar el programa principal sobre el archivo binario
    ./main "${TEMP_FILE}"

    # Convertir de binario a PNG
    python3 fromBin2PNG.py "${TEMP_FILE}.new"

    echo "Procesamiento de $INPUT_JPG completado."
done