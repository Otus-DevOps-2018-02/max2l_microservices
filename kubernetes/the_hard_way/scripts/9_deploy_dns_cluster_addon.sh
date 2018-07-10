#!/bin/sh
cd ../the_hard_way/
kubectl create -f https://storage.googleapis.com/kubernetes-the-hard-way/kube-dns.yaml
kubectl get pods -l k8s-app=kube-dns -n kube-system
kubectl run busybox --image=busybox --command -- sleep 3600
kubectl get pods -l run=busybox
POD_NAME=$(kubectl get pods -l run=busybox -o jsonpath="{.items[0].metadata.name}")
kubectl exec -ti $POD_NAME -- nslookup kubernetes

cd -

