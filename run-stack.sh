#!/bin/bash

aws cloudformation $ACTION \
    --region us-east-1 \
    --stack-name $STACK_NAME \
    --template-body file://service.yaml \
    --capabilities CAPABILITY_NAMED_IAM \
    --parameters \
    ParameterKey=DockerImage,ParameterValue=426934385949.dkr.ecr.us-east-1.amazonaws.com/example-webapp:$(git rev-parse HEAD) \
    ParameterKey=VPC,ParameterValue=vpc-35665e4f
    ParameterKey=Cluster,ParameterValue=default \
    ParameterKey=Listener,ParameterValue=arn:aws:elasticloadbalancing:us-east-1:426934385949:listener/app/production-website/9e278df14b99912d/b12002b52113d0bf
