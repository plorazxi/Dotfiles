#!/bin/bash

# Defina a sua bateria (ajuste se a saída do passo 1 foi diferente)
BATTERY="BAT0"
WARNING_LEVEL=15
CRITICAL_LEVEL=10

while true; do
    # Lê o status (Carregando/Descarregando) e a capacidade atual
    STATUS=$(cat /sys/class/power_supply/$BATTERY/status)
    CAPACITY=$(cat /sys/class/power_supply/$BATTERY/capacity)

    if [ "$STATUS" = "Discharging" ]; then
        if [ "$CAPACITY" -le "$CRITICAL_LEVEL" ]; then
            notify-send -u critical "Bateria Crítica!" "O notebook vai desligar! ($CAPACITY%)"
            sleep 60 # Avisa a cada 1 minuto nesse nível crítico
        elif [ "$CAPACITY" -le "$WARNING_LEVEL" ]; then
            notify-send -u normal "Bateria Baixa" "Conecte o carregador. ($CAPACITY%)"
            sleep 300 # Avisa a cada 5 minutos
        else
            sleep 300 # Checa a cada 5 minutos se a bateria estiver ok
        fi
    else
        sleep 300 # Se estiver na tomada, checa a cada 5 minutos
    fi
done
