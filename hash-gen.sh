#!/bin/bash
#
#  Copyright (c) 2019 General Electric Company. All rights reserved.
#
#  The copyright to the computer software herein is the property of
#  General Electric Company. The software may be used and/or copied only
#  with the written permission of General Electric Company or in accordance
#  with the terms and conditions stipulated in the agreement/contract
#  under which the software has been supplied.
#
#  author: apolo.yasuda@ge.com
#

source <(wget -O - https://raw.githubusercontent.com/EC-Release/sdk/disty/scripts/agt/v1.2beta.linux64.txt) -ver

if [[ ! -z "${EC_PPRS}" ]]; then
  export EC_PPS=$EC_PPRS
fi

EC_PPS=$(agent -hsh -smp -dbg)
EC_PPS=$(agent -hsh -pvk "$EC_PVK" -pbk "$EC_PBK" -dat "$lic_pps" -smp)
EC_PPS=$(echo "${EC_PPS##*$'\n'}")

EC_PPS=$(agent -hsh -smp -dbg)

# verify if the pk exists
cd ./../
git clone https://${EC_TKN}@github.com/EC-Release/pkeys.git
if [ -f "./pkey/${lic_id}.key" ]; then
  export LIC_PVK=$(cat ./pkey/${lic_id}.key|base64 -w0)  
fi
cd -
if [ -f "./cert-list/${lic_id}.cer" ]; then
  export LIC_PBK=$(cat ./cert-list/${lic_id}.cer|base64 -w0)  
fi

if [[ -z "${LIC_PVK}" || -z "${LIC_PBK}" ]]; then
  printf "\n\n**** keypair is invalid. Exiting the workflow.\n"
  exit -1
fi

# if it does exist
EC_PPS=$(agent -hsh -pvk "$LIC_PVK" -pbk "$LIC_PBK" -smp)
EC_PPS=$(echo "${EC_PPS##*$'\n'}")

echo "LIC_HSH=$EC_PPS" >> $GITHUB_ENV