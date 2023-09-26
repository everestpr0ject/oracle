#!/bin/bash

# Función para mostrar mensajes de carga
function mostrar_carga {
  echo "Conectando a EEUU..."
  sleep 3
  echo "Conectando a CANADA..."
  sleep 3
  echo "Conectando a Irán..."
  sleep 3
  echo "Conexión exitosa"
  sleep 2
}

# Función para mostrar el menú principal
function mostrar_menu {
  clear
  echo "Simulador de Cuenta de Criptomonedas"
  echo "1. Estado de cuenta"
  echo "2. Historial"
  echo "3. Transferencia"
  echo "4. Cerrar sesión"
}

# Función para mostrar el saldo
function mostrar_saldo {
  clear
  echo -e "Estado de cuenta\n"
  echo -e "Saldo: \e[32m$2.394.472 dólares\e[0m"
  read -p "Presiona Enter para volver al menú principal" pausa
}

# Función para mostrar el historial
function mostrar_historial {
  clear
  echo -e "Historial\n"
  echo "Historial de transferencias:"
  # Puedes agregar aquí el código para mostrar el historial
  read -p "Presiona Enter para volver al menú principal" pausa
}

# Función para realizar una transferencia
function realizar_transferencia {
  clear
  echo "Transferencia"
  read -p "País: " pais
  read -p "Banco: " banco
  read -p "Número de cuenta: " num_cuenta
  echo "Realizando transferencia a $pais, Banco: $banco, Número de cuenta: $num_cuenta"
  sleep 2
  echo "Transferencia exitosa"
  read -p "Presiona Enter para volver al menú principal" pausa
}

# Función de despedida
function despedida {
  clear
  echo "Gracias por usar el Simulador de Cuenta de Criptomonedas"
  exit
}

# Inicio del programa
mostrar_carga

while true; do
  mostrar_menu
  read -p "Selecciona una opción: " opcion

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
      echo "Opción inválida. Por favor, selecciona una opción válida."
      sleep 2
      ;;
  esac
done
