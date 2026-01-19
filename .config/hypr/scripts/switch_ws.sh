#!/bin/bash

# El primer argumento es el número de la tecla presionada (1 al 10)
KEY=$1

# 1. Obtener el nombre o ID del monitor enfocado
MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')

# 2. Definir el desplazamiento (Offset)
# Si es el monitor secundario (ajusta el nombre según tu 'hyprctl monitors'), suma 10
if [ "$MONITOR" == "eDP-1" ]; then  # <--- CAMBIA "DP-1" por el nombre de tu 2do monitor
    TARGET=$((KEY + 10))
else
    TARGET=$KEY
fi

# 3. Cambiar al workspace resultante
hyprctl dispatch workspace $TARGET