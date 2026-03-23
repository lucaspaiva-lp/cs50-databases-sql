#!/bin/bash
set -e

# 1. Configuração Silenciosa do Git (Backup)
if [ -n "$GITHUB_USER" ] && [ -n "$GITHUB_TOKEN" ]; then
    git config --global credential.helper store
    echo "https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com" > /root/.git-credentials
    git config --global credential.helper 'store --file=/root/.git-credentials'
    echo "Configuração de ambiente injetada para: $GITHUB_USER"
else
    echo "Aviso: GITHUB_USER ou GITHUB_TOKEN não configurados no .env"
fi

# 2. Criação do Automatizador de Prompt (Expect)
# Isso vai "digitar" o usuário e token por você quando o check50 pedir
cat << 'EOF' > /usr/local/bin/check50-auto
#!/usr/bin/expect -f
set timeout -1
set user $env(GITHUB_USER)
set token $env(GITHUB_TOKEN)
set args [lrange $argv 0 end]

# Inicia o check50 original
spawn /usr/local/bin/check50 {*}$args

# Espera o prompt de usuário e dá um respiro de 1 segundo
expect "Enter username for GitHub: "
sleep 1
send -- "$user\r"

# Espera o prompt de token e dá um respiro de 1 segundo
expect "Enter personal access token for GitHub: "
sleep 1
send -- "$token\r"

# Mantém o controle no terminal para você ver o resultado
interact
EOF

chmod +x /usr/local/bin/check50-auto

# 3. Alias para transparência no terminal
# Faz com que digitar 'check50' chame o nosso script automático
echo "alias check50='/usr/local/bin/check50-auto'" >> /root/.bashrc

# 4. Entrega o controle para o container
exec "$@"