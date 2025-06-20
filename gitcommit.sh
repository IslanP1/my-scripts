#!/bin/bash
# Uso: gitcommit

echo "Selecione o tipo de commit:"
select TYPE in feat fix chore docs style refactor perf test ci build revert outro; do
  case $TYPE in
    outro)
      read -p "Digite o tipo de commit personalizado: " TYPE
      break
      ;;
    *)
      break
      ;;
  esac
done

read -p "Digite uma breve descrição do commit: " DESC

# Formata o código se houver arquivos JS ou TS
if ls *.js *.ts 1> /dev/null 2>&1; then
  if [ -f ./node_modules/.bin/eslint ]; then
    echo "Formatando código com ESLint..."
    ./node_modules/.bin/eslint --fix . || echo "ESLint não conseguiu corrigir todos os problemas."
  elif command -v eslint >/dev/null 2>&1; then
    echo "Formatando código com ESLint global..."
    eslint --fix . || echo "ESLint não conseguiu corrigir todos os problemas."
  fi
  if [ -f ./node_modules/.bin/prettier ]; then
    echo "Formatando código com Prettier..."
    ./node_modules/.bin/prettier --write . || echo "Prettier não conseguiu formatar todos os arquivos."
  elif command -v prettier >/dev/null 2>&1; then
    echo "Formatando código com Prettier global..."
    prettier --write . || echo "Prettier não conseguiu formatar todos os arquivos."
  fi
fi

COMMIT_MSG="$TYPE: $DESC"

git add .
git commit -m "$COMMIT_MSG"