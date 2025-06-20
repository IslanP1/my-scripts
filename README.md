# Meus Scripts de Automação

Este repositório contém scripts Bash para facilitar tarefas comuns de desenvolvimento, especialmente para projetos Node.js, Docker e Git.

## Scripts disponíveis

### `startnode.sh`
Clona um repositório Node.js, instala dependências (com Yarn ou NPM), cria `.env` se necessário, sobe containers Docker Compose e abre o VS Code na raiz do projeto.

**Uso:**
```bash
./startnode.sh <url-do-repositorio> [npm|yarn]
```

---

### `startcompose.sh`
Procura por arquivos `docker-compose.yml` em um diretório (e subdiretórios) e sobe todos os containers encontrados.

**Uso:**
```bash
./startcompose.sh [diretorio]
```

---

### `stopcontainers.sh`
Para todos os containers Docker em execução.

**Uso:**
```bash
./stopcontainers.sh
```

---

### `gitinit.sh`
Inicializa um repositório Git, faz o commit inicial e (opcionalmente) adiciona um repositório remoto.

**Uso:**
```bash
./gitinit.sh
```

---

### `gitcommit.sh`
Auxilia na criação de commits padronizados (feat, fix, chore, etc.), formata o código JS/TS com ESLint/Prettier antes do commit e executa `git add .`.

**Uso:**
```bash
./gitcommit.sh
```

---

### `workcm.sh`
Acessa um diretório base, sobe containers Docker Compose se houver, abre o VS Code e o navegador em uma URL específica.

**Uso:**
```bash
./workcm.sh
```

---

## Como usar

1. Dê permissão de execução aos scripts:
   ```bash
   chmod +x *.sh
   ```

2. (Opcional) Crie aliases no seu `~/.bashrc`:
   ```bash
   alias startnode='/caminho/para/startnode.sh'
   alias startcompose='/caminho/para/startcompose.sh'
   alias stopcontainers='/caminho/para/stopcontainers.sh'
   alias gitinit='/caminho/para/gitinit.sh'
   alias gitcommit='/caminho/para/gitcommit.sh'
   alias workcm='/caminho/para/workcm.sh'
   ```

3. Recarregue o terminal:
   ```bash
   source ~/.bashrc
   ```

---

## Requisitos

- Bash
- Git
- Docker e Docker Compose
- Node.js, Yarn e/ou NPM (para projetos Node)
- VS Code (para abrir projetos automaticamente)
- ESLint/Prettier (opcional, para formatação automática)

---

## Observações

- Scripts feitos para Linux.
- Personalize os caminhos e URLs conforme sua necessidade.
- Use