---

# 📄 docs/architecture.md

````md id="s7n0su"
# Architecture

## Services

| Service   | Role           |
| --------- | -------------- |
| Portainer | Docker UI      |
| Node-RED  | IoT Automation |
| Mosquitto | MQTT Broker    |
| InfluxDB  | Time-Series DB |
| Grafana   | Monitoring     |
| MySQL     | Relational DB  |
| Traefik   | Reverse Proxy  |

## Flow

```text
IoT Device
    ↓
MQTT Broker
    ↓
Node-RED
    ↓
InfluxDB
    ↓
Grafana
```
````
