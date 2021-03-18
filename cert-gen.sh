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

#{
  printf "\n ******* is big endian *******\n"
  echo -n I | od -to2 | head -n1 | cut -f2 -d" " | cut -c6 
  printf "\n *****************************\n"
  date -u
  
  agent -hsh -smp -dbg
  #agent -hsh -pvk "$EC_PVK" -pbk "$EC_PBK" -dat "$lic_pps" -smp -dbg
#} || {
  date -u
  ls -al ~/.ec/
  ls -Art ~/.ec/*.log | tail -n 1
  cat $(ls -Art ~/.ec/*.log | tail -n 1)
  #ls -lt ~/.ec/*.log | tail -1
  #cat $(ls -lt ~/.ec/*.log | tail -1)
#}

: 'EC_LIC_PPS=$(agent -hsh -pvk $EC_PVK -pbk $EC_PBK -dat $lic_pps -smp)
printf "\n*** convert pps\n"
EC_PPS=$(echo "${EC_LIC_PPS##*$'\n'}")
printf "\n*** got final pps\n"
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
