#!/bin/bash

set -e

echo "===================================="
echo "Configurando servidor Jenkins"
echo "===================================="

echo "Atualizando pacotes..."

apt-get update -y

echo "Instalando dependências..."

apt-get install -y \
    fontconfig \
    openjdk-17-jre \
    curl \
    wget \
    git

echo "Instalando Jenkins..."

wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" \
> /etc/apt/sources.list.d/jenkins.list

apt-get update -y

apt-get install -y jenkins

echo "Habilitando Jenkins..."

systemctl enable jenkins
systemctl start jenkins

echo "===================================="
echo "Jenkins instalado com sucesso!"
echo "===================================="

systemctl status jenkins --no-pager || true