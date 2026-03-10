#!/bin/bash

# Argumento: Tecla presionada (1-10)
KEY=$1
MONITOR_SECUNDARIO="eDP-1"

# 1. Obtener monitor enfocado
FOCUSED_OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused==true).name')

# 2. Calcular target
if [ "$FOCUSED_OUTPUT" == "$MONITOR_SECUNDARIO" ]; then
    TARGET=$((KEY + 10))
else
    TARGET=$KEY
fi

# 3. Mover la ventana al workspace destino
swaymsg move container to workspace number $TARGET

# 4. (NUEVO) Moverte tú también a ese workspace
swaymsg workspace number $TARGET