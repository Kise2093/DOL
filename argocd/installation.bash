kubectl create ns argo
helm repo add argo https://argoproj.github.io/argo-helm
helm -n argo install argo-cd argo/argo-cd --version 5.4.2
kubectl label namespaces argo istio-injection=enabled

kubectl -n argo create secret generic custom-ca --from-file=unique_name=/root/cert/custom-ca.pem

kubectl -n nexusrepo apply -f gw.yaml

kubectl -n nexusrepo apply -f vs.yaml