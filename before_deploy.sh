#!/bin/bash
#op=$(ls -t csr-list/ | awk '{printf("%s",$0);exit}')
#op=$(git log -1 --pretty=%B csr-list)
op=$(ls -1t csr-list/ | head -)
export CSR_ID="${op%.*}"
printf "\n\n**** CSR_ID: %s\n\n" "$CSR_ID"

export REQ_EMAIL=$(openssl req -in ./csr-list/$CSR_ID.csr -noout -text | grep -Po '([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)')
printf "\n\n**** Req Email: %s\n\n" "$REQ_EMAIL"

# ensure to issue the enclosed license in below dir 
mkdir -p cert-list/beta
cd cert-list/beta/

source <(wget -O - https://raw.githubusercontent.com/EC-Release/sdk/disty/scripts/agt/v1.2beta.linux64.txt) -ver

if [[ ! -z "${EC_PPRS}" ]]; then
  export EC_PPS=$EC_PPRS
fi

echo $EC_PVK | base64 --decode > ca.key
echo $EC_PBK | base64 --decode > ca.cer

EC_PPS=$(agent -hsh -smp)
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
