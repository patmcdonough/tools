#!/bin/sh

aws --region us-west-2 ec2 describe-security-groups --group-ids $2  >  ~/before.txt

while read line
do
  aws --region us-west-2 ec2 authorize-security-group-ingress --group-id $2  --protocol tcp --port 443 --cidr $line/32
done < "${1:-/proc/${$}/fd/0}"

aws --region us-west-2 ec2 describe-security-groups --group-ids $2  > ~/after.txt

while read line
do
	grep -q "$line" ~/after.txt ||  echo "$line is missing" 
done < "${1:-/proc/${$}/fd/0}"

diff -y ~/before.txt ~/after.txt

rm ~/before.txt ~/after.txt



