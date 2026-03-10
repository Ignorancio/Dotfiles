#!/bin/bash

# Argumento: Tecla presionada (1-10)
KEY=$1
MONITOR_SECUNDARIO="eDP-1" # <--- Ajusta si es necesario

# 1. Obtener el nombre del monitor enfocado usando swaymsg
FOCUSED_OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true).name')

# 2. Calcular el target
if [ "$FOCUSED_OUTPUT" == "$MONITOR_SECUNDARIO" ]; then
    TARGET=$((KEY + 10))
else
    TARGET=$KEY
fi

# 3. Ejecutar cambio
swaymsg workspace number $TARGET