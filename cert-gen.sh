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

#printf "\n**** EC_PVK: %s\n\n**** EC_PBK: %s" "$(echo $EC_PVK|base64 --decode)" "$(echo $EC_PBK|base64 --decode)"
#printf "\n**** pps: %s\n" "$EC_PPS" 

if [[ -z "${EC_PPRS}" ]]; then
  export EC_PPS=$EC_PPRS
fi

EC_PPS=$(agent -hsh -smp -dbg)
EC_PPS=$(agent -hsh -pvk "$EC_PVK" -pbk "$EC_PBK" -dat "$lic_pps" -smp -dbg)
EC_PPS=$(echo "${EC_PPS##*$'\n'}")
printf "\n**** pps: %s\n" "$EC_PPS" 
agent -sgn <<MSG
${lic_common}
${lic_country}
${lic_state}
${lic_city}
${lic_zip}
${lic_address}
${lic_organization}
${lic_unit}
${lic_dns}
${lic_email}
${lic_cer_alg}
${lic_key_alg}
no
MSG'
