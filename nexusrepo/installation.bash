kubectl create ns nexusrepo
helm -n nexusrepo install nexus-rm sonatype/nexus-repository-manager --version 41.1.3 \
--set nexus.docker.enabled=true \
--set nexus.docker.registries[0].host=pipr-uat-nexusrepos.dol.go.th \
--set nexus.docker.registries[0].port=5000

kubectl -n nexusrepo create secret generic custom-ca --from-file=unique_name=/root/cert/custom-ca.pem
kubectl -n nexusrepo apply -f gw-vs.yaml
