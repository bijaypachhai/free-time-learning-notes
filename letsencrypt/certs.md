# SSL Certificates with Let's Encrypt

### Extract Domain Names from Certificate

```bash
sudo openssl x509 -in fullchain.pem -noout -subject -issuer -ext subjectAltName
```

### If using Certbot, you can see the configured certificate domains with

```bash
sudo certbot certificates
```
