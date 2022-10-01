kubectl create ns argo
helm repo add argo https://argoproj.github.io/argo-helm
helm -n argo upgrade --install argo-cd argo/argo-cd --version 5.4.1 \
--set redis.enabled=false \
--set redis-ha.persistentVolume.enabled=true \
--set redis-ha.enabled=true

kubectl label namespaces argo istio-injection=enabled

kubectl -n argo create secret generic custom-ca --from-file=unique_name=/root/cert/custom-ca.pem


kubectl -n argo apply -f gw.yaml

kubectl -n argo apply -f vs.yaml


k -n argo edit deployments.apps argo-cd-argocd-server

add - --insecure 
#in container env