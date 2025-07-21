#!/bin/bash

# Detectar si hay monitores externos conectados
if hyprctl monitors all | grep -qw "DP-1"; then
    # Monitor DP-1 detectado - activar solo DP-1 y apagar la laptop
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "HDMI-A-1,disable"
    hyprctl keyword monitor "DP-1,1920x1080,0x0,1"
elif hyprctl monitors all | grep -qw "HDMI-A-1"; then
    # Monitor HDMI-A-1 detectado - activar solo HDMI-A-1 y apagar la laptop
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "DP-1,disable"
    hyprctl keyword monitor "HDMI-A-1,1920x1080,1366x0,1"
else
    # Ningún monitor externo detectado - activar solo pantalla de la laptop
    hyprctl keyword monitor "DP-1,disable"
    hyprctl keyword monitor "HDMI-A-1,disable"
    hyprctl keyword monitor "eDP-1,preferred,auto,1"
fi
