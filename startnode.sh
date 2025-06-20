#!/bin/bash
# Uso: startjs <url-do-repositorio> [npm|yarn]
# Exemplo: ./startjs https://github.com/user/repo.git npm

# Define o gerenciador (yarn por padrão)
GERENCIADOR=${2:-yarn}

# Verifica se o gerenciador está instalado, senão tenta instalar
check_gerenciador() {
  if ! command -v "$GERENCIADOR" &>/dev/null; then
    echo "⚠️  $GERENCIADOR não encontrado. Tentando instalar..."
    if [ "$GERENCIADOR" = "yarn" ]; then
      corepack enable
      corepack prepare yarn@stable --activate
    elif [ "$GERENCIADOR" = "npm" ]; then
      npm install -g npm
    else
      echo "❌ Gerenciador inválido: $GERENCIADOR"
      exit 1
    fi
  fi
}

# Clona o repositório
if [ -z "$1" ]; then
  echo "Uso: startjs <url-do-repositorio> [npm|yarn]"
  exit 1
fi

check_gerenciador

git clone "$1" || exit 1
cd "$(basename "$1" .git)" || exit 1

# Função para processar uma pasta com package.json
processar_pasta() {
  local dir="$1"
  echo "➡️  Processando pasta: $dir"
  pushd "$dir" > /dev/null || return

  echo "🔧 Instalando dependências com $GERENCIADOR..."
  "$GERENCIADOR" install

  # Criar .env vazio na pasta atual, se necessário
  if [ ! -f .env ]; then
    touch .env
    echo "✅ Arquivo .env vazio criado em $dir."
  else
    echo "ℹ️ Arquivo .env já existe em $dir, nada será feito."
  fi

  # Docker Compose
  if [ -f docker-compose.yml ]; then
    echo "🐳 docker-compose.yml encontrado em $dir. Subindo containers..."
    sudo docker compose up -d
  fi

  popd > /dev/null
}

# 👉 Processa package.json da raiz
if [ -f package.json ]; then
  echo "🎯 Instalando dependências na raiz do projeto..."
  processar_pasta "."
fi

# 👉 Processa package.json em subpastas
find . -mindepth 2 -name package.json | while read -r pkg; do
  dir=$(dirname "$pkg")
  processar_pasta "$dir"
done

# 👉 Abre VS Code na raiz do projeto
echo "🚀 Abrindo VS Code na raiz do projeto..."
code .

echo "✅ Tudo concluído com sucesso!"
