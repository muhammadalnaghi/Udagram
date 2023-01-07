#!/bin/bash

STACK_NAME="NaghiProject2-ser"
ACTION=$1

case $ACTION in

  create)
    aws cloudformation create-stack \
    --stack-name $STACK_NAME \
    --template-body file://serv2.yaml \
    --parameters file://serv-para.json \
    --capabilities "CAPABILITY_IAM" "CAPABILITY_NAMED_IAM" \
    --region=us-east-1
    ;;

  update)
    aws cloudformation update-stack \
    --stack-name $STACK_NAME \
    --template-body file://serv2.yaml \
    --parameters file://serv-para.json
    ;;

  delete)
    aws cloudformation delete-stack \
    --stack-name $STACK_NAME
    ;;

  *)
    echo -n "unknown argument, expecting (create | update | delete)"
    ;;
esac
