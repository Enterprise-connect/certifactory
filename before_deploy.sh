#!/bin/bash
#export CSR_FILE=$(ls -t csr-list/ | awk '{printf("%s",$0);exit}')
export REQ_EMAIL=$(openssl req -in csr-list/$CSR_ID.csr -noout -text | grep -Po '([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)')
echo ********* Requester Email: $REQ_EMAIL
cd cert-list/beta/
bash <(curl -s https://enterprise-connect.github.io/oci/k8s/conf.txt) -ver
echo $CA_PKEY | base64 --decode > ca.key
echo $CA_CERT | base64 --decode > ca.cer
export EC_PPS=$(./agent_linux_sys -hsh -dat $CA_PPRS)
./agent_linux_sys -sgn <<MSG
ca.key
365
DEVELOPER
EC_ECO
Seat_x1
./../../csr-list/${CSR_ID}.csr
no 
ca.cer
MSG
rm ca.key ca.cer agent_linux_sys
ls -al ./ && ls -al ./../..
cd -
