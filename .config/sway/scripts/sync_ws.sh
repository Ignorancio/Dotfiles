#!/bin/bash

# Argumento: Tecla presionada (1-10)
KEY=$1

MONITOR_PRINCIPAL="DP-1"
MONITOR_SECUNDARIO="eDP-1"

# 1. Guardar quién tiene el foco actualmente para devolverlo al final
ORIGINAL_FOCUS=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true).name')

# 2. Calcular workspaces
WS_MAIN=$KEY
WS_SEC=$((KEY + 10))

# 3. Ejecutar los cambios (Sway necesita enfocar el output para cambiar su workspace)
# Primero cambiamos el secundario
swaymsg focus output $MONITOR_SECUNDARIO
swaymsg workspace number $WS_SEC

# Luego cambiamos el principal
swaymsg focus output $MONITOR_PRINCIPAL
swaymsg workspace number $WS_MAIN

# 4. Devolver el foco a donde estaba originalmente
swaymsg focus output $ORIGINAL_FOCUS