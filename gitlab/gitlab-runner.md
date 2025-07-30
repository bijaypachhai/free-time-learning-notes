# Gitlab Runner
Gitlab runner picks up jobs defined in CI/CD pipelines. 

## Install Gitlab Runner as daemon service

```bash
$ sudo gitlab-runner install --user=<sudo-privileged-user>
$ sudo systemctl start gitlab-runner
$ sudo systemctl status gitlab-runner

```

The configuration file for gitlab-runner is available at `/etc/gitlab-runner/config.toml`
