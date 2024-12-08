#!/bin/bash

aws s3 mb s3://matrix-terraform-backend 

aws dynamodb create-table \
    --table-name matrix-terraform-backend \
    --attribute-definitions \
        AttributeName=LockID,AttributeType=S \
    --key-schema \
        AttributeName=LockID,KeyType=HASH \
    --provisioned-throughput \
        ReadCapacityUnits=5,WriteCapacityUnits=5

