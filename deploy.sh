#!/bin/bash
git stash
git checkout disty
git stash apply
git config user.email "EC.Bot@ge.com"
git config user.name "EC Bot"
git add cert-list/.
git commit -m "licensed to $CSR_ID [skip ci]"
git push
