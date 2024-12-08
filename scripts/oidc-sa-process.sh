#!/bin/bash

REGION="us-east-1"
#CLUSTER_NAME="matrix-eks-cluster"
CLUSTER_NAME="dev-vpc-matrix"
NAMESPACE="development"
S3_POLICY="iam-policy-s3.json"
ACCOUNT_ID="058264436363"


# Create policies
aws cloudformation deploy \
    --stack-name ${NAMESPACE}-iam-policy-s3 \
    --template-file iam-policy-s3.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides \
        Namespace=${NAMESPACE}


aws cloudformation deploy \
    --stack-name ${NAMESPACE}-iam-policy-dynamodb \
    --template-file iam-policy-dynamodb.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameter-overrides \
        Namespace=${NAMESPACE}



# set up oidc provider
eksctl utils associate-iam-oidc-provider \
    --region $REGION --cluster $CLUSTER_NAME --approve


# create SA and Role for s3-app
eksctl create iamserviceaccount \
  --name app-dynamodb-iam-service-account \
  --namespace development \
  --cluster $CLUSTER_NAME \
  --attach-policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/${NAMESPACE}-dynamodb-policy \
  --approve


# create SA and Role for dynamodb-app
eksctl create iamserviceaccount \
  --name app-s3-iam-service-account \
  --namespace development \
  --cluster $CLUSTER_NAME \
  --attach-policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/${NAMESPACE}-s3-policy \
  --approve