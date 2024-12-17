#!/usr/bin/bash

base_ip="10.65"

port=7777

# Mensaje a enviar
message="Hola chicos :D"

# Iterar sobre todas las IPs en el rango 10.65.0.0/16
for i in {0..255}; do
    for j in {0..255}; do
        ip="${base_ip}.${i}.${j}"
        echo "Enviando mensaje a ${ip} por el puerto ${port}..."
        
        # Enviar mensaje usando netcat (timeout para evitar bloqueo en IPs no activas)
        echo "$message" | nc -w 1 $ip $port 2>/dev/null
    done
done

