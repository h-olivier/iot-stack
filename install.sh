#!/bin/bash

echo "======================================"
echo "      IOT STACK INSTALLER"
echo "======================================"

echo ""
echo "Updating system..."
sudo apt update

echo ""
echo "Installing Docker..."
sudo apt install -y docker.io docker-compose

echo ""
echo "Starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo ""
echo "Creating Mosquitto directories..."
mkdir -p mosquitto/config
mkdir -p mosquitto/data
mkdir -p mosquitto/log

echo ""
echo "Starting IoT Stack..."
docker compose up -d

echo ""
echo "======================================"
echo "IoT Stack Successfully Started"
echo "======================================"

echo ""
echo "Services:"
echo "Portainer : http://localhost:9000"
echo "Node-RED  : http://localhost:1880"
echo "Grafana   : http://localhost:3000"
echo "InfluxDB  : http://localhost:8086"

echo ""
echo "Default Credentials:"
echo "Grafana  -> admin / admin123"
echo "InfluxDB -> admin / admin123"
echo "MySQL    -> root / root123"