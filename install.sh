#!/bin/bash

mkdir -p generated

OUTPUT="generated/docker-compose.yml"

clear

CHOICES=$(whiptail \
--title "Secure IoT Stack Installer" \
--checklist "Choose stacks to install" 20 60 10 \
"PORTAINER" "Docker Management UI" OFF \
"NODERED" "IoT Automation" OFF \
"MOSQUITTO" "MQTT Broker TLS" OFF \
"INFLUXDB" "Time-Series Database" OFF \
"GRAFANA" "Monitoring Dashboard" OFF \
"MYSQL" "SQL Database" OFF \
"TRAEFIK" "HTTPS Reverse Proxy" OFF \
3>&1 1>&2 2>&3)

clear

echo "version: '3.9'" > $OUTPUT
echo "" >> $OUTPUT
echo "services:" >> $OUTPUT

for choice in $CHOICES
do

    case $choice in

        "\"PORTAINER\"")
            cat stacks/portainer.yml >> $OUTPUT
        ;;

        "\"NODERED\"")
            cat stacks/nodered.yml >> $OUTPUT
        ;;

        "\"MOSQUITTO\"")
            cat stacks/mosquitto.yml >> $OUTPUT
        ;;

        "\"INFLUXDB\"")
            cat stacks/influxdb.yml >> $OUTPUT
        ;;

        "\"GRAFANA\"")
            cat stacks/grafana.yml >> $OUTPUT
        ;;

        "\"MYSQL\"")
            cat stacks/mysql.yml >> $OUTPUT
        ;;

        "\"TRAEFIK\"")
            cat stacks/traefik.yml >> $OUTPUT
        ;;
    esac
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
echo " INSTALLATION FINISHED"
echo "======================================"

echo ""
echo "Default Credentials"

echo ""
echo "Grafana"
echo " user: admin"
echo " pass: admin123"

echo ""
echo "Node-RED"
echo " user: admin"
echo " pass: admin123"

echo ""
echo "MQTT"
echo " user: iot"
echo " pass: iot123"

echo ""
echo "MySQL"
echo " user: root"
echo " pass: root123"