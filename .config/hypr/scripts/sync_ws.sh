#!/bin/bash

# La tecla presionada (1-10)
KEY=$1

# 1. Obtener la lista de todos los monitores activos en formato JSON
# 2. Usar jq para iterar sobre cada monitor y ejecutar el cambio

ACTUAL_MONITOR=$(hyprctl -j activeworkspace | jq -r '.monitor')

hyprctl monitors -j | jq -r '.[] | .name + " " + (.id | tostring)' | while read -r name id; do
    
    # Calculamos el workspace objetivo para este monitor específico
    # Monitor ID 0 -> 0*10 + KEY = 1..10
    # Monitor ID 1 -> 1*10 + KEY = 11..20
    # ... y así sucesivamente
    
    OFFSET=$(( id * 10 ))
    TARGET=$(( KEY + OFFSET ))
    
    # IMPORTANTE: Usamos 'focusmonitor' antes de 'workspace' para asegurar 
    # que cada monitor cambie independientemente
    hyprctl dispatch focusmonitor "$name"
    hyprctl dispatch workspace "$TARGET"
done

# 3. Opcional: Devolver el foco al monitor donde estaba originalmente el cursor
# (Si prefieres que el ratón no se mueva de pantalla, esto es opcional)

hyprctl dispatch focusmonitor "$ACTUAL_MONITOR"