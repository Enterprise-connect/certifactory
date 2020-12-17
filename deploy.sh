#!/bin/bash
git config user.email "EC.Bot@ge.com"
git config user.name "EC Bot"
git add cert-list/.
git checkout .
git commit -m 'licensed to '$CSR_ID' [skip ci]'
git push https://${GITHUB_TOKEN}@github.com/EC-Release/certifactory.git HEAD:release
