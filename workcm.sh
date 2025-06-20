#!/bin/bash
# Uso: workcm <diretorio-base>

BASE_DIR="${1:-.}/Documentos/trabalho/CONCEITO_MAXIMO/SociedadeConectada"

cd "$BASE_DIR" || { echo "Diretório base não encontrado!"; exit 1; }

if [ -f docker-compose.yml ]; then
  echo "Subindo containers docker-compose..."
  sudo docker compose up -d
else
  echo "Nenhum docker-compose.yml encontrado nesta pasta."
fi

code .

firefox "https://github.com/MatheusNunes133/SociedadeConectada"