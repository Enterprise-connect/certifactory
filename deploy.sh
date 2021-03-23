#!/bin/bash
git config user.email "EC.Bot@ge.com"
git config user.name "EC Bot"
git add cert-list/.
git commit -m "licensed to $CSR_ID [skip ci]"
git push


git clone https://${EC_TKN}@github.com/EC-Release/pkeys.git
cd pkeys
mv ${CSR_ID}.key ${DEV_ID}.key
git add .
git config user.email "EC.Bot@ge.com"
git config user.name "EC Bot"
git commit -m "pkey $CSR_ID mappped to $DEV_ID [skip ci]"
git push
