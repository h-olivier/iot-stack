
```md id="m9wwyx"
# Security Documentation

## Implemented Security

- HTTPS/TLS
- MQTT authentication
- Grafana authentication
- MySQL authentication
- Docker internal networking

## Recommendations

- Change default passwords
- Use firewall
- Enable backups
- Use VPN
- Use Fail2Ban
- Use CrowdSec

## Docker Security

Avoid:

- privileged containers
- root containers
- public database exposure

Recommended:

```yaml
restart: unless-stopped