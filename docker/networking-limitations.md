# Limitations on Docker containers due to Network layer add-on

## Networking Architecture

### Bridge Network (default)

- Containers get private IPs
- NAT through host
- Uses iptables rules
- Slight overhead
- Can hit conntrack limits

### Host Network Mode

- No NAT
- Better performance
- Fewer connection tracking issues
- Less isolation

Use for:
- Very high throughput systems
- Low latency systems

## TCP connection limits (kernel)

### File descriptor limits (common bottleneck)

Each TCP connection = 1 file descriptor

```bash
ulimit -n

cat /proc/sys/fs/file-max

## increase
ulimit -n 100000

## permanent increase
/etc/security/limits.conf

sysctl -w fs.file-max=1000000

## If you don't raise this, your app will fail with:
EMFILE: too many open files

```

## Ephemeral Port Exhaustion

```bash
## Linux ephemeral port range

cat /proc/sys/net/ipv4/ip_local_port_range

sysctl -w net.ipv4.ip_local_port_range="1024 65535"
```
Important for:
- High outbound traffic
- Microservices
- DB-heavy apps

## TIME_WAIT Accumulation
High trafic -> lots of TIME_WAIT sockets

```bash
ss -s

## tune with
sysctl -w net.ipv4.tcp_tw_reuse=1
sysctl -w net.ipv4.tcp_fin_timeout=15
```

> [!Important]
> Don't blindly enable deprecated `tcp_tw_recycle` (removed in modern kernels)

## conntrack Table limits (Docker NAT issue)
Docker bridge relies heavily on connection tracking

```bash
sysctl -w net.netfilter.nf_conntrack_max=262144
```

Very important under:
- Load balancer
- Reverse proxies
- Many short-lived HTTP requests

