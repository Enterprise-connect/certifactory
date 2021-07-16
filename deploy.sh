#!/bin/bash
echo "$DEV_ID" | tee -a  crt-list.txt > /dev/null
git config user.email "EC.Bot@ge.com"
git config user.name "EC Bot"
git add crt-list.txt
git commit -m "licensed to $CSR_ID [skip ci]"
git checkout -b disty
git pull origin disty
git merge beta
git push origin disty

cd ..
git clone https://${EC_TKN}@github.com/EC-Release/x509.git
cd x509
mv ./../certifactory/cert-list/${DEV_ID}.cer ./crt-list/
git add .
git config user.email "EC.Bot@ge.com"
git config user.name "EC Bot"
git commit -m "crt ${DEV_ID} checked-in [skip ci]"
git push
cd ./../certifactory
