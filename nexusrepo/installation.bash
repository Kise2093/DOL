kubectl create ns nexusrepo
helm -n nexusrepo install nexus-rm sonatype/nexus-repository-manager --version 41.1.3
kubectl -n nexusrepo create secret generic custom-ca --from-file=unique_name=/root/cert/custom-ca.pem
kubectl -n nexusrepo apply -f gw-vs.yaml
