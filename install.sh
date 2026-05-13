#!/bin/bash

clear

echo "======================================"
echo "      SECURE IOT STACK INSTALLER"
echo "======================================"

mkdir -p generated

OUTPUT="generated/docker-compose.yml"

echo "version: '3.9'" > $OUTPUT
echo "" >> $OUTPUT

echo "services:" >> $OUTPUT

echo ""
echo "Choose stacks to install:"
echo ""

echo "[1] Portainer"
echo "[2] Node-RED"
echo "[3] Mosquitto MQTT"
echo "[4] InfluxDB"
echo "[5] Grafana"
echo "[6] MySQL"
echo "[7] Traefik TLS"
echo "[8] Install ALL"

echo ""

read -p "Enter choices (example: 1 2 5): " choices

install_stack() {

    case $1 in

        1)
            echo "Adding Portainer..."
            cat stacks/portainer.yml >> $OUTPUT
        ;;

        2)
            echo "Adding Node-RED..."
            cat stacks/nodered.yml >> $OUTPUT
        ;;

        3)
            echo "Adding Mosquitto..."
            cat stacks/mosquitto.yml >> $OUTPUT
        ;;

        4)
            echo "Adding InfluxDB..."
            cat stacks/influxdb.yml >> $OUTPUT
        ;;

        5)
            echo "Adding Grafana..."
            cat stacks/grafana.yml >> $OUTPUT
        ;;

        6)
            echo "Adding MySQL..."
            cat stacks/mysql.yml >> $OUTPUT
        ;;

        7)
            echo "Adding Traefik..."
            cat stacks/traefik.yml >> $OUTPUT
        ;;

        8)
            echo "Installing ALL stacks..."

            cat stacks/*.yml >> $OUTPUT
            return
        ;;

        *)
            echo "Invalid choice: $1"
        ;;
    esac
}

for choice in $choices
do
    install_stack $choice
done

echo ""
echo "======================================"
echo " GENERATED DOCKER COMPOSE"
echo "======================================"

cat $OUTPUT

echo ""
echo "Starting containers..."

docker compose -f $OUTPUT up -d

echo ""
echo "======================================"
echo " INSTALLATION COMPLETED"
echo "======================================"