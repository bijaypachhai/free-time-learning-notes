for component in kube-proxy kube-controller-manager kube-scheduler; do
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=ca.crt \
    --embed-certs=true \
    --server=https://server.kubernetes.local:6443 \
    --kubeconfig=${component}.kubeconfig

  kubectl config set-credentials system:${component} \
    --client-certificate=${component}.crt \
    --client-key=${component}.key \
    --embed-certs=true \
    --kubeconfig={component}.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:${component} \
    --kubeconfig=${component}.kubeconfig

  kubectl config use-context default \
    --kubeconfig=${component}.kubeconfig
done
