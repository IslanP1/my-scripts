#!/bin/bash
# Uso: startcompose [diretório]

DIR="${1:-.}"

find "$DIR" -type f -name "docker-compose.yml" | while read compose; do
  dir=$(dirname "$compose")
  echo "Encontrado docker-compose.yml em $dir. Subindo containers..."
  (cd "$dir" && docker compose up -d)
done