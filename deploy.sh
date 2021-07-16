#!/bin/bash
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
