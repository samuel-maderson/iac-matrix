#!/bin/bash

CLUSTER_NAME="dev-vpc-matrix"

OIDC_PROVIDER_URL=$(aws eks describe-cluster --name $CLUSTER_NAME --query "cluster.identity.oidc.issuer" --output text)
BASE_OIDC_PROVIDER_URL=$(echo ${OIDC_PROVIDER_URL} | sed 's|^https://||' | sed 's|/.*$||')

openssl s_client -showcerts -connect ${BASE_OIDC_PROVIDER_URL}:443 </dev/null 2>/dev/null | openssl x509 -outform PEM > /tmp/eks_oidc_root_ca.pem

# Calculate the thumbprint (SHA1 hash)
openssl x509 -in /tmp/eks_oidc_root_ca.pem -noout -fingerprint -sha1 | cut -d '=' -f2 | sed 's/://g' | tr '[A-Z]' '[a-z]'