# Install Specific Version of Docker

## List the available versions

```bash
$ apt-cache madison docker-ce | awk '{ print $3 }'

$ export VERSION_STRING=5:28.3.3-1~ubuntu.24.04~noble
$ sudo apt-get install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-buildx-plugin docker-compose-plugin

```