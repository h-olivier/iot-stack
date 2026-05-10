# 🚀 IoT Docker Stack

Infrastructure IoT professionnelle basée sur Docker Compose.

---

# 📌 Description

Ce projet fournit une plateforme IoT complète contenant :

- MQTT Broker (Mosquitto)
- Node-RED
- InfluxDB
- Grafana
- MySQL
- Portainer

L’objectif est de fournir une architecture :

- modulaire
- réutilisable
- rapide à déployer
- adaptée au développement IoT

---

# 🧠 Architecture

```id="8ptquv"
MQTT Sensors
      ↓
 Mosquitto Broker
      ↓
   Node-RED
      ↓
 InfluxDB / MySQL
      ↓
   Grafana
```
