#!/bin/bash
git config user.email "EC.Bot@ge.com"
git config user.name "EC Bot"
git add cert-list/.
git commit -m "licensed to $CSR_ID [skip ci]"
git fetch origin disty
git checkout disty
git merge beta
git push origin disty
