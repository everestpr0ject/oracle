#!/bin/bash

# Función para mostrar mensajes de carga

# Función para mostrar el menú principal
function mostrar_menu {
  clear

 echo -e "\e[31m +-+-+-+-+-+ +-+-+-+-+-+-+
 \e[37m|N|E|I|N|C| |H|O|S|T|E|R|
 \e[31m+-+-+-+-+-+ +-+-+-+-+-+-+
"
echo -e "\e[37mConnected to: \e[32mIRAN \e[37m(\e[33m171.22.24.3\e[37m) on port: \e[35m27030"
  echo ""
  echo -e "\e[37m[\e[35m1\e[37m] - Account Status"
  echo -e "\e[37m[\e[35m2\e[37m] - History"
  echo -e "\e[37m[\e[35m3\e[37m] - Transfer"
  echo -e "\e[37m[\e[35m4\e[37m] - Logout"
  echo ""
}

function formatear_numero {
  local num=$1
  local formatted=""
  while [[ $num -ge 1000 ]]; do
    formatted=".$(printf "%03d" $((num % 1000)))$formatted"
    num=$((num / 1000))
  done
  formatted="$num$formatted"
  echo "$formatted"
}

# Función para mostrar el saldo
function mostrar_saldo {
  clear
balance=$((2838452 + RANDOM % 2943794))
formatted_balance=$(formatear_numero "$balance")
  echo -e "\e[31m   _____________ ________  ______
  / __/_  __/ _ /_  __/ / / / __/
 _\ \  / / / __ |/ / / /_/ /\ \  
/___/ /_/ /_/ |_/_/  \____/___/                                 
\e[37m"
echo ""
echo "--------------------------------"
echo ""
  echo -e "Current Balance: \e[32m$ $formatted_balance \e[37mUSD\e[0m"
  echo -e "\e[37mPreference: \e[35mMonero (XMR)"
  echo -e "\e[37mLast: \e[33mAtlanta Services LLC\e[37m"
  echo ""
  echo -e "--------------------------------"
  echo ""
  read -p "Go to menu" pausa
}

# Función para mostrar el historial
function mostrar_historial {
  clear
  echo "Transfer history:"
  # Generar 50 transferencias aleatorias en el historial
  for ((i=1; i<=50; i++)); do
    nombre=$(shuf -n 1 nombres_aleatorios.txt)
    pais=$(shuf -n 1 paises_aleatorios.txt)
    banco=$(shuf -n 1 bancos_aleatorios.txt)
    num_cuenta=$((1000000000 + RANDOM % 9000000000))
    cantidad=$((100 + RANDOM % 900))
    
    # Mostrar información con formato
    echo -e "\e[37mTransfer from:\e[34m $nombre"
    echo -e "\e[37mBank: \e[35m$banco"
    echo -e "\e[37mAccount Number: \e[31m$num_cuenta"
    echo -e "\e[37mAmount: \e[32m$ $cantidad"
    echo
  done
  read -p "Go to menu" pausa
}

# Función para realizar una transferencia
function realizar_transferencia {
  clear
  echo -e "
\e[36m████████╗██████╗  █████╗ ███╗   ██╗███████╗███████╗███████╗██████╗ 
╚══██╔══╝██╔══██╗██╔══██╗████╗  ██║██╔════╝██╔════╝██╔════╝██╔══██╗
   ██║   ██████╔╝███████║██╔██╗ ██║███████╗█████╗  █████╗  ██████╔╝
   ██║   ██╔══██╗██╔══██║██║╚██╗██║╚════██║██╔══╝  ██╔══╝  ██╔══██╗
   ██║   ██║  ██║██║  ██║██║ ╚████║███████║██║     ███████╗██║  ██║
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝     ╚══════╝╚═╝  ╚═╝                                                                  
\e[37m"
  read -p "Country: " pais
  read -p "Bank: " banco
  read -p "Account Number: " num_cuenta
  echo -e "Sending transfer to $pais, Bank: $banco, Account Number: $num_cuenta"
  sleep 2
  echo -e "Successful"
  read -p "Go to menu" pausa
}

# Función de despedida
function despedida {
  clear
  echo -e "Logged out."
  exit
}

# Inicio del programa
mostrar_carga

while true; do
  mostrar_menu
  read -p "Choice: " opcion

  case $opcion in
    1)
      mostrar_saldo
      ;;
    2)
      mostrar_historial
      ;;
    3)
      realizar_transferencia
      ;;
    4)
      despedida
      ;;
    *)
      echo -e "Invalid option"
      sleep 2
      ;;
  esac
done
