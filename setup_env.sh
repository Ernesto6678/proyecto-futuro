#!/bin/bash
# Script de configuración inicial para Soluciones Tecnológicas del Futuro

echo "Actualizando el sistema..."
sudo apt update -y

echo "Instalando paquetes esenciales: git, vim, docker, python3..."
sudo apt install -y git vim docker.io python3-pip

echo "Iniciando y habilitando Docker..."
sudo systemctl start docker
sudo systemctl enable docker

echo "Instalando Boto3 para Python..."
pip3 install boto3

echo "Configuración completada con éxito."
