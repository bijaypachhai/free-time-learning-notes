for HOST in node-0 node-1; do
  SUBNET=$(grep ${HOST} machines.txt | cut -d " " -f 4)
  sed "s|SUBNET|$SUBNET|g" \
    kubernetes-the-hard-way/configs/10-bridge.conf > 10-bridge.conf

  sed "s|SUBNET|$SUBNET|g" \
    kubernetes-the-hard-way/configs/kubelet-config.yaml > kubelet-config.yaml

  scp 10-bridge.conf kubelet-config.yaml \
  workeruser@${HOST}:~/configs
done


for HOST in node-0 node-1; do
  scp \
    downloads/worker/* \
    kubernetes-the-hard-way/configs/99-loopback.conf \
    kubernetes-the-hard-way/configs/containerd-config.toml \
    kubernetes-the-hard-way/configs/kube-proxy-config.yaml \
    kubernetes-the-hard-way/units/containerd.service \
    kubernetes-the-hard-way/units/kubelet.service \
    kubernetes-the-hard-way/units/kube-proxy.service \
    workeruser@${HOST}:~/
done
