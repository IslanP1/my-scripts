#!/bin/bash

# Inicializa o repositório Git
git init

# Define a branch principal como main
git branch -m main

# Adiciona todos os arquivos
git add .

# Faz o commit inicial
git commit -m "Initial commit"

# Pergunta se há um repositório remoto para adicionar
read -p "Deseja adicionar um repositório remoto? (s/n): " add_remote

if [[ "$add_remote" =~ ^[Ss]$ ]]; then
    read -p "Informe a URL do repositório remoto: " remote_url
    git remote add origin "$remote_url"
    echo "Repositório remoto adicionado como 'origin'."

    git push --set-upstream origin main
fi
