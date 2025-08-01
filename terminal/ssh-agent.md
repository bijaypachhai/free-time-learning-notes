```bash
[Unit]
Description=SSH Agent
After=default.target

[Service]
Type=simple
Environment=SSH_AUTH_SOCK=%t/ssh-agent.socket
ExecStart=/usr/bin/ssh-agent -D -a $SSH_AUTH_SOCK

[Install]
WantedBy=default.target
```

```bash
systemctl --user daemon-reexec
systemctl --user daemon-reload
systemctl --user enable --now ssh-agent.service


export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
```

# simple method in shell profile
```bash
# Start ssh-agent if not running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)" > ~/.ssh/agent.env
fi

# Reuse existing agent info
if [ -f ~/.ssh/agent.env ]; then
    source ~/.ssh/agent.env > /dev/null
    export SSH_AUTH_SOCK SSH_AGENT_PID
fi
```
