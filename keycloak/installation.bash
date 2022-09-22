kubectl create ns keycloak
helm repo add bitnami https://charts.bitnami.com/
helm install keycloak -f values.yaml bitnami/keycloak -n keycloak --timeout 60m
kubectl -n keycloak create secret generic custom-ca --from-file=unique_name=/root/cert/custom-ca.pem


 helm -n keycloak install keycloak codecentric/keycloak --set ingress.tls[0].hosts={pipr-uat-keycloak.dol.go.th} --set ingress.console.tls[0].hosts={pipr-uat-keycloak.dol.go.th} --set service.httpNodePort=30001 --set service.httpsNodePort=30002

  k -n keycloak edit statefulsets.apps keycloak

  - name: KEYCLOAK_USER
          value: admin
        - name: KEYCLOAK_PASSWORD
          value: P@ssw0rd
