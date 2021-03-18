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

EC_PPS=$(agent -hsh -smp)
EC_LIC_PPS=$(agent -hsh -pvk ${EC_PVK} -pbk ${EC_PBK} -dat ${lic_pps} -smp)
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
MSG
