# Notes


## Generating Certificates and Keys for Components

### Generating Client Certificate for the kubernetes admin user

```bash
certs=(
  "admin" "node-0" "node-1"
  "kube-proxy" "kube-scheduler"
  "kube-api-server"
  "kube-controller-manager"
)

```

### Kubelet in Nodes

```bash

$ mkdir /var/lib/kubelet
$ cp ca.crt /var/lib/kubelet
$ cp node-i.key /var/lib/kubelet/kubelet.key
$ cp node-i.crt /var/lib/kubelet/kubelet.crt

```

### Kubernetes Configuration Files for Authentication (kubeconfig)

Kubernetes Client Configuration Files, typically called `kubeconfig`'s, configure kubernetes clients to connect and authenticate to the kubernetes API servers.

```markdown
(Created using node-i.crt, node-i.key and ca.crt)
node-0.kubeconfig  ===> /var/lib/kubelet/kubeconfig  (worker1)
node-1.kubeconfig  ===> /var/lib/kubelet/kubeconfig  (worker2)

kube-proxy.kubeconfig   ====>  /var/lib/kube-proxy/kubeconfig (worker)

kube-controller-manager.kubeconfig  ====> /var/lib/kubernetes/kube-controller-manager.kubeconfig (master)

kube-scheduler.kubeconfig  ====> /var/lib/kubernetes/kube-scheduler.kubeconfig (master)

admin.kubeconfig
```

### ETCD server

```markdown

copy ca.crt kube-api-server.key kube-api-server.crt to /etc/etcd

```

## Setting up Control Plane
Moving kube-apiserver, kube-controller-manager, kube-scheduler binaries to `/usr/local/bin`

### Configure Kubernetes API server
```bash
{
  mkdir -p /var/lib/kubernetes/

  mv ca.crt ca.key \
    kube-api-server.key kube-api-server.crt \
    service-accounts.key service-accounts.crt \
    encryption-config.yaml \
    /var/lib/kubernetes/
}
```
