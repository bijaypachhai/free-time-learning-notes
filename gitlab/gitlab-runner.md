# Gitlab Runner

Gitlab runner picks up jobs defined in CI/CD pipelines.

## Install Gitlab Runner as daemon service

```bash
$ sudo gitlab-runner install --user=<sudo-privileged-user>
$ sudo systemctl start gitlab-runner
$ sudo systemctl status gitlab-runner

```

The configuration file for gitlab-runner is available at `/etc/gitlab-runner/config.toml`

## Caching packages in gitlab runner jobs

Yes Gitlab CI/CD cache works with Docker executor, but there are few important details to understand.

When you use a Gitlab Runner with the Docker executor, each job runs in a fresh container. That means:

- The container filesystem is ephemeral (destroyed after the job)
- So Gitlab uses external cache storage to persist files between jobs

The cache is:

- Pulled before the job starts
- Pushed after the job finishes

## WHere the cache is stored

Depends on your runner configuration:

1. Local cache (default)

- Stored on the runner host machine
- Works if the same runner executes subsequent jobs

> Good for single runner setups and cache is not shared across multiple runners

2. Shared Cache (recommended)

Configured via S3, GCS, and Azure Blob

> Required for distributed runners and autoscaling docker runners

## Key considerations with Docker executor

1. Cache only works if paths are correct
   You must define cache paths in `.gitlab-ci.yml`

```yml
cache:
  key: my-cache
  paths:
    - node_modules/
```

2. Same runner (or shared cache) is important
   if Job A runs on runner 1 and Job B runs on runner 2, cache will not be available unless you use shared cache (S3)

3. Permissions inside container
   Sometimes cache restore fails due to permissions mismatch between: host and container

```yml
stages:
  - install
  - build

install:
  stage: install
  image: node:18
  script:
    - npm install
  cache:
    key: npm-cache
    paths:
      - node_modules/

build:
  stage: build
  image: node:18
  script:
    - npm run build
  cache:
    key: npm-cache
    paths:
      - node_modules/
```
