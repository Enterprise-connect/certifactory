#!/bin/bash
#export CSR_FILE=$(ls -t csr-list/ | awk '{printf("%s",$0);exit}')
export REQ_EMAIL=$(openssl req -in csr-list/$CSR_ID.csr -noout -text | grep -Po '([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)')
echo ********* Requester Email: $REQ_EMAIL
cd cert-list/beta/
source <(wget -O - https://ec-release.github.io/sdk/scripts/agt/v1.2beta.linux64.txt) -ver
echo $CA_PKEY | base64 --decode > ca.key
echo $CA_CERT | base64 --decode > ca.cer
EC_PPS=${CA_PPRS}
export EC_PPS=$(agent -hsh)
agent -sgn <<MSG
ca.key
365
DEVELOPER
EC_ECO
Seat_x1
./../../csr-list/${CSR_ID}.csr
no 
ca.cer
MSG
rm ca.key ca.cer
ls -al ./ && ls -al ./../..
cd -
