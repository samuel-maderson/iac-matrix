#!/bin/bash

REGION="us-east-1"
APP_NAME="app2"
CLUSTER_NAME="dev-eks-matrix"
NAMESPACE="dev"
ACCOUNT_ID="211125308281"


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
  --name "${APP_NAME}-dynamodb-iam-service-account" \
  --namespace $NAMESPACE \
  --cluster $CLUSTER_NAME \
  --attach-policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/${NAMESPACE}-dynamodb-policy \
  --approve


# create SA and Role for dynamodb-app
eksctl create iamserviceaccount \
  --name "${APP_NAME}-s3-iam-service-account" \
  --namespace $NAMESPACE \
  --cluster $CLUSTER_NAME \
  --attach-policy-arn arn:aws:iam::${ACCOUNT_ID}:policy/${NAMESPACE}-s3-policy \
  --approve