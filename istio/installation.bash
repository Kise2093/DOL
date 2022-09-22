helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update istio
kubectl create namespace istio-system

helm install istio-base istio/base -n istio-system

helm -n istio-system install istio-ingressgateway istio/gateway
--set service.externalIPs=10.1.0.100,
