


Install wso2

helm repo add wso2 https://helm.wso2.com && helm repo update
k -n wso create secret generic custom-ca --from-file=unique_name=/root/cert/custom-ca.pem
kubectl label namespaces wso istio-injection=enabled

helm upgrade --install patt-3 wso2/am-pattern-3 --version 4.1.0-1 --namespace wso --create-namespace \
--set wso2.deployment.am.gateway.ingress.hostname=pipr-uat-gateway.dol.go.th \
--set wso2.deployment.am.cp.ingress.hostname=pipr-uat-mgt.dol.go.th \
--set wso2.deployment.am.websub.ingress.hostname=pipr-uat-websub.dol.go.th \
--set wso2.deployment.mi.ingress.management.hostname=pipr-uat-management.dol.go.th \
--set wso2.deployment.persistentRuntimeArtifacts.storageClass=nfs-client \
--set wso2.deployment.persistentRuntimeArtifacts.apacheSolrIndexing.enabled=true

kubectl -n wso apply -f gw-vs.yaml


Install Choreo

helm upgrade --install choreo wso2/choreo-connect --version 1.1.0-6 --namespace wso \
--set wso2.deployment.mode=APIM_AS_CP \
--set wso2.apim.controlPlane.hostName=pipr-uat-mgt.dol.go.th \
--set wso2.apim.controlPlane.serviceName=wso2am-pattern-3-am-cp-1-service \
--set wso2.deployment.gatewayRuntime.router.ingress.hostname=pipr-uat-gateway.dol.go.th


Install Identify Server not used

helm upgrade --install patt-1-is wso2/is-pattern-1 --version 5.11.0-5 --namespace wso2 \
--set wso2.deployment.wso2is.ingress.identity.hostname=pipr-uat-kas.dol.go.th \
--set wso2.deployment.persistentRuntimeArtifacts.storageClass=nfs-client
