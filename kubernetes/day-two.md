# Commands for Reference

```bash

$ kubectl get po -n kube-system  ## kube-system namespace
$ kubectl get po -A              ## all namespaces
$ kubectl get pods -o wide
$ kubectl get no
$ kubectl get deployment
$ kubectl get services
$ kubectl delete pods


======================

$ kubectl exec -it <podName> -- /bin/sh

```