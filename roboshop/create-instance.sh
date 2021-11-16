#!/bin/bash

 COUNT=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=$1" | jq ".Reservations[].Instances[].InstanceId" | wc -l)

if [ $COUNT -eq 0 ]; then
   aws ec2 run-instances --image-id ami-0855cab4944392d0a --instance-type t3.micro --security-group-ids sg-000e3d77edcfc8e1f --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$1}]" | jq
else
  echo "instance already exists"
fi

