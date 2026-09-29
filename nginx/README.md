# All About Nginx

### server `index.html` for every route and path

```
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;
        index index.html index.htm index.nginx-debian.html;

        server_name _;

        location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                # $uri $uri/ /index.html =404;
                try_files $uri $uri/ /index.html;

                #rewrite ^ index.html break;
        }
        location = /index.html {
                root /var/www/html;
                #index index.nginx-debian.html;
        }

        # deny access to .htaccess files, if Apache's document root
        # concurs with nginx's one
        #
        #location ~ /\.ht {
        #       deny all;
        #}
}
```
