# Deploying React Application after building static files with vite

We have added a base prefix in `vite.config.ts` to forward requests from internet facing **Apache Web server** to private **Nginx server**.

The URL is `projects.wendevs.com/pms-frontend/`. The base prefix is `pms-frontend`.

### Nginx Server Configuration

```conf
server {
  listen 3004;
  server_name <PRIVATE_IP_ADDRESS>;
  root /var/www/html;

  location / {
    index index.nginx-debian.html index.htm;
  }

  location /pms-frontend/ {
    root /var/www;  # static files are present in pms-frontend directory
    # pms-frontend directory in present inder /var/www

    try_files $uri $uri/ /pms-frontend/;
  }

}
```

`try_files` directive

1. First, look for a real file or folder ($uri and $uri/).

2. If not found, fall back to /react/index.html, which boots your React app