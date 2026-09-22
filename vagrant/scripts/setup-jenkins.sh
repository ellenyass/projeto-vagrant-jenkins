#!/bin/bash
set -e

echo "========================================"
echo "Configurando servidor Jenkins"
echo "========================================"

echo "Atualizando pacotes..."
apt-get update -y

echo "Instalando dependências..."
apt-get install -y \
  fontconfig \
  openjdk-21-jdk \
  curl \
  wget \
  git

echo "Instalando Jenkins..."
mkdir -p /etc/apt/keyrings

wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" > /etc/apt/sources.list.d/jenkins.list

apt-get update -y
apt-get install -y jenkins

echo "Habilitando Jenkins..."
systemctl enable jenkins
systemctl start jenkins

echo "========================================"
echo "Jenkins instalado com sucesso!"
echo "========================================"

systemctl status jenkins --no-pager || true
