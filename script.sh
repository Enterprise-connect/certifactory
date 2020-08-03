#!/bin/bash

#export CSRID='git log --format=%B -n 1 $(git rev-parse @~)' && openssl req -in ./csr-list/${CSRID}.csr -noout -text
#git log && git log --all --format=%B --grep='.csr' -n 1
export CSR_ID=$(git log --format=%B --no-merges -n 1 | grep -Po '[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}')
if [ -z "$CSR_ID" ]; then
    echo ******** invalid csrid: $CSR_ID 
    exit 1
fi
   
export SN_NUM=$(openssl req -in csr-list/$CSR_ID.csr -noout -text | grep -Po '[0-9a-fA-F]{8}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{4}\-[0-9a-fA-F]{12}')
 
if [ "$CSR_ID" != "$SN_NUM" ]; then
    echo ******** the serialnumber $SN_NUM does not match the csrid: $CSR_ID 
    exit 1
fi
 
echo ******** the serialnumber $SN_NUM matches the csrid $CSR_ID 
openssl req -in csr-list/$CSR_ID.csr -noout -text
