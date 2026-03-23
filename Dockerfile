# 1. Imagem base leve
FROM python:3.11-slim

# 2. Instala dependências do sistema (Git para o CS50 e SQLite para os exercícios)
RUN apt-get update && apt-get install -y \
    git \
    libsqlite3-dev \
    expect \
    && rm -rf /var/lib/apt/lists/*

# 3. Instala as ferramentas do CS50 e utilitários de terminal
RUN pip install --no-cache-dir \
    check50 \
    submit50 \
    sqlparse \
    termcolor

# 4. Configuração do ambiente de trabalho
WORKDIR /app

# 5. O segredo da automação: O Script de Entrada
# Vamos copiar o script que criamos para automatizar o login do GitHub
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Define que o container SEMPRE passará pelo script antes de iniciar
ENTRYPOINT ["entrypoint.sh"]

# Comando padrão caso nenhum outro seja passado
CMD ["bash"]