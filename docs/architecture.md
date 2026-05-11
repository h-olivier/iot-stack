# 🚀 IoT Stack Documentation

## 📌 Overview

This project provides a secure and modular IoT infrastructure based on Docker Compose.

The stack includes:

- MQTT Broker (Mosquitto)
- Node-RED
- InfluxDB
- Grafana
- MySQL
- Portainer
- Traefik Reverse Proxy
- TLS/HTTPS Security

The objective is to provide:

- Fast deployment
- Secure communication
- Modular architecture
- Reusable infrastructure
- Professional IoT environment

---

# 🧠 Global Architecture

```text
                  Internet
                      ↓
              HTTPS / TLS (443)
                      ↓
                Traefik Proxy
                      ↓
 -------------------------------------------------
 |       Grafana       |      Node-RED           |
 -------------------------------------------------
                      ↓
               Internal Docker Network
                      ↓
 -------------------------------------------------
 | Mosquitto | InfluxDB | MySQL | Portainer |
 -------------------------------------------------
                      ↓
                 IoT Devices
```

---

# 🐳 Services Description

## 📡 Mosquitto MQTT Broker

### Purpose

Mosquitto is used as the MQTT communication broker between IoT devices and applications.

### Features

- MQTT protocol
- MQTT over TLS
- User authentication
- Persistent messages
- Logging support

### Ports

| Port | Description     |
| ---- | --------------- |
| 1883 | MQTT Standard   |
| 8883 | MQTT TLS Secure |

### Security

- MQTT authentication enabled
- TLS certificates enabled
- Anonymous access disabled

---

## 🔄 Node-RED

### Purpose

Node-RED is used for:

- IoT automation
- Workflow orchestration
- MQTT processing
- Database integration
- Dashboard creation

### Features

- MQTT integration
- Database integration
- HTTP API support
- Authentication enabled

### Port

| Port | Description |
| ---- | ----------- |
| 1880 | Node-RED UI |

### Security

- Admin authentication enabled
- HTTPS via Traefik
- Password-protected dashboard

---

## 📊 InfluxDB

### Purpose

InfluxDB stores time-series IoT sensor data.

### Features

- Time-series database
- High-performance writes
- Token authentication
- Grafana integration

### Port

| Port | Description  |
| ---- | ------------ |
| 8086 | InfluxDB API |

### Security

- Admin authentication
- API token
- Internal Docker communication

---

## 📈 Grafana

### Purpose

Grafana provides dashboards and real-time IoT visualization.

### Features

- Real-time monitoring
- IoT dashboards
- InfluxDB integration
- Alerting support

### Port

| Port | Description       |
| ---- | ----------------- |
| 3000 | Grafana Dashboard |

### Security

- HTTPS enabled
- Admin authentication
- Internal network communication

---

## 🗄 MySQL

### Purpose

MySQL stores structured application data.

### Features

- Relational database
- Persistent storage
- User management
- Docker volume support

### Port

| Port | Description    |
| ---- | -------------- |
| 3306 | MySQL Database |

### Security

- Password authentication
- Internal Docker network
- Persistent encrypted storage recommended

---

## 🧰 Portainer

### Purpose

Portainer provides Docker management through a web interface.

### Features

- Container management
- Docker monitoring
- Logs management
- Volume management

### Ports

| Port | Description |
| ---- | ----------- |
| 9000 | HTTP        |
| 9443 | HTTPS       |

### Security

- HTTPS support
- Authentication enabled
- Docker socket access

---

## 🔐 Traefik Reverse Proxy

### Purpose

Traefik manages:

- HTTPS
- TLS certificates
- Reverse proxy routing
- Secure access

### Features

- Automatic HTTPS
- Let's Encrypt support
- Docker integration
- Security headers

### Ports

| Port | Description |
| ---- | ----------- |
| 80   | HTTP        |
| 443  | HTTPS       |

---

# 🔒 Security Architecture

## TLS/HTTPS

The stack uses:

- HTTPS for web applications
- TLS for MQTT communication
- Secure certificates
- Encrypted communication

---

# 🔐 Docker Security Best Practices

## 1. Environment Variables

Sensitive information is stored inside `.env`:

```env
MYSQL_ROOT_PASSWORD=
GRAFANA_ADMIN_PASSWORD=
MQTT_PASSWORD=
```

---

## 2. Internal Docker Networks

Services communicate through private Docker networks.

Benefits:

- Reduced attack surface
- Service isolation
- Better segmentation

---

## 3. Authentication

Authentication enabled for:

| Service   | Authentication       |
| --------- | -------------------- |
| MQTT      | Username + Password  |
| Node-RED  | Admin Login          |
| Grafana   | Admin Login          |
| MySQL     | Database Credentials |
| Portainer | Admin Login          |

---

## 4. TLS Certificates

TLS certificates secure:

- MQTT communication
- HTTPS dashboards
- Reverse proxy traffic

---

## 5. Persistent Volumes

Persistent Docker volumes prevent data loss.

Volumes:

- grafana_data
- influxdb_data
- mysql_data
- nodered_data

---

## 6. Docker Restart Policies

All services use:

```yaml
restart: unless-stopped
```

Benefits:

- Automatic recovery
- High availability
- Better resilience

---

## 7. Avoiding Root Containers

Recommended:

```yaml
user: "1000:1000"
```

Avoid:

```yaml
user: root
```

---

# 🚀 Installation

## 1. Clone Repository

```bash
git clone https://github.com/USERNAME/iot-stack.git
cd iot-stack
```

---

## 2. Configure Environment Variables

```bash
cp .env.example .env
nano .env
```

---

## 3. Generate TLS Certificates

```bash
openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout mosquitto/certs/server.key \
-out mosquitto/certs/server.crt
```

---

## 4. Start Stack

```bash
docker compose up -d
```

---

## 5. Verify Containers

```bash
docker ps
```

---

# 📊 Monitoring Commands

## Logs

```bash
docker compose logs -f
```

---

## Restart Services

```bash
docker compose restart
```

---

## Stop Stack

```bash
docker compose down
```

---

# 🔥 Recommended Production Improvements

## Recommended Additions

| Technology | Purpose                |
| ---------- | ---------------------- |
| Prometheus | Metrics Monitoring     |
| Loki       | Centralized Logs       |
| CrowdSec   | Intrusion Protection   |
| Fail2Ban   | Brute Force Protection |
| Vault      | Secrets Management     |
| WireGuard  | VPN Access             |

---

# ⚠️ Common Security Mistakes

| Mistake               | Risk                |
| --------------------- | ------------------- |
| MQTT anonymous access | Unauthorized access |
| Exposed databases     | Data leak           |
| No TLS                | Traffic sniffing    |
| Using latest tag      | Instability         |
| No backups            | Data loss           |
| Root containers       | System compromise   |

---

# 📦 Backup Recommendations

Recommended backup targets:

- MySQL volumes
- InfluxDB volumes
- Grafana dashboards
- Node-RED flows
- MQTT configuration

Example:

```bash
docker run --rm \
-v mysql_data:/volume \
-v $(pwd):/backup \
ubuntu tar cvf /backup/mysql-backup.tar /volume
```

---

# 📈 Future Scalability

The architecture is designed to support:

- Kubernetes migration
- Edge computing
- AI/ML integration
- Distributed IoT systems
- Multi-site deployments
- Cloud integration

---

# 👨‍💻 Project Goal

Build a secure, modular, scalable, and professional IoT infrastructure suitable for:

- Learning
- Research
- Prototyping
- Production-ready evolution
