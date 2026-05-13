````md id="ml2q3g"
# TLS Configuration

## Generate Certificates

```bash
openssl req -x509 -nodes -days 365 \
-newkey rsa:2048 \
-keyout mosquitto/certs/server.key \
-out mosquitto/certs/server.crt
```
````

## MQTT TLS Port

8883

## HTTPS

Traefik automatically handles HTTPS certificates.

## Recommended

Let's Encrypt
Cloudflare
DuckDNS
