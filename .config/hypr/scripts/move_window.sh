#!/bin/bash

# Uso: ./move_window.sh [número_del_1_al_10]
WORKSPACE_BASE=$1

# 1. Obtener el NOMBRE del monitor actual (Ej: HDMI-A-1, eDP-1, DP-2)
CURRENT_MONITOR_NAME=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .name')

# 2. Definir cuál es tu monitor secundario (el que debe tener 11-20)
# ¡CAMBIA ESTO por el nombre real que te dio 'hyprctl monitors'!
MONITOR_PRINCIPAL="DP-1"
MONITOR_SECUNDARIO="eDP-1"

# 3. Lógica
if [ "$CURRENT_MONITOR_NAME" == "$MONITOR_SECUNDARIO" ]; then
    # Si estoy en el monitor secundario, sumo 10
    TARGET=$((WORKSPACE_BASE + 10))
elif [ "$CURRENT_MONITOR_NAME" == "$MONITOR_PRINCIPAL" ]; then
    # Si estoy en cualquier otro (el principal), mantengo el número original
    TARGET=$WORKSPACE_BASE
fi

# 4. Mover la ventana
hyprctl dispatch movetoworkspace $TARGET