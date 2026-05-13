# Installation Guide

## Requirements

- Docker
- Docker Compose
- Whiptail

Install dependencies:

```bash
sudo apt update
sudo apt install docker.io docker-compose whiptail -y
```

## Clone Repository

```bash
git clone https://github.com/USERNAME/iot-stack.git
cd iot-stack
```

## Permissions

```bash
chmod +x install.sh
```

## Start Installer

```bash
./install.sh
```

## Start Stack and Stop Stack

```bash
docker compose up -d
docker compose down
```
