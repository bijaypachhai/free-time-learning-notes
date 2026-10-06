server {
  server_name _;

  ## The timing format mentioned below is defined in `nginx.conf`
  access_log /var/log/nginx/test.example.com-access.log timing;
  error_log /var/log/nginx/test.example.com-error.log;
}