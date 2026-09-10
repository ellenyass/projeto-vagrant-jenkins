#!/bin/bash

set -e

echo "===================================="
echo "Configurando servidor PROD"
echo "===================================="

echo "Atualizando pacotes..."

apt-get update -y

echo "Instalando dependências..."

apt-get install -y curl git openssh-server
echo "Instalando Node.js..."

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

apt-get install -y nodejs

echo "Verificando instalação..."

node --version
npm --version

echo "===================================="
echo "Node.js instalado com sucesso!"
echo "===================================="
