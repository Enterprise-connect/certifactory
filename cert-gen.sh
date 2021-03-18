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
EC_LIC_PPS=$(agent -hsh -pvk ${EC_PVK} -pbk ${EC_PBK} -dat ${lic-pps})
EC_PPS=$(echo "${EC_LIC_PPS##*$'\n'}")
agent -sgn <<MSG
${lic-common}
${lic-country}
${lic-state}
${lic-city}
${lic-zip}
${lic-address}
${lic-organization}
${lic-unit}
${lic-dns}
${lic-email}
${lic-cer-alg}
${lic-key-alg}
no
MSG
