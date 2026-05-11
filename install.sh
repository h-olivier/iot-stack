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
#!/bin/bash

echo "======================================"
echo " SECURE TLS IOT STACK INSTALLER"
echo "======================================"

echo ""
echo "Updating packages..."
sudo apt update

echo ""
echo "Installing Docker..."
sudo apt install -y docker.io docker-compose openssl apache2-utils

echo ""
echo "Starting Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo ""
echo "Creating directories..."

mkdir -p mosquitto/config
mkdir -p mosquitto/data
mkdir -p mosquitto/log
mkdir -p mosquitto/certs
mkdir -p nodered
mkdir -p traefik

echo ""
echo "Generating TLS certificates..."

openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout mosquitto/certs/server.key \
-out mosquitto/certs/server.crt \
-subj "/CN=localhost"

echo ""
echo "Setting permissions..."

chmod 600 traefik/acme.json

echo ""
echo "Starting IoT Stack..."

docker compose up -d

echo ""
echo "======================================"
echo " IoT STACK READY WITH TLS"
echo "======================================"

echo ""
echo "HTTPS Services:"
echo "https://grafana.localhost"
echo "https://nodered.localhost"
echo "https://portainer.localhost"

echo ""
echo "MQTT TLS Port: 8883"

echo ""
echo "Credentials"

echo "MQTT"
echo " user: iot"
echo " pass: iot123"

echo ""

echo "Node-RED"
echo " user: admin"
echo " pass: admin123"

echo ""

echo "Grafana"
echo " user: admin"
echo " pass: admin123"

echo ""

echo "MySQL"
echo " user: root"
echo " pass: root123"
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