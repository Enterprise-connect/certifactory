[![Build Status](https://travis-ci.com/Enterprise-connect/certs.svg?branch=beta)](https://travis-ci.com/Enterprise-connect/certs)

# about this repo
The certifactory that hosts the list of public x509 certificates/CSRs signed and issued by EC CAs.

## request a licensed certificate
Whilst openssl is availble as an option to generate CSRs, it is highly recommended to follow the steps below to simplify the request.

## generate a CSR

### step 1. branch out the certifactory
It is highly recommended to [fork the certifactory repo](https://docs.github.com/en/github/getting-started-with-github/fork-a-repo). For beta-relate certificate, please branch out from the ```beta``` branch, branch out the ```release``` branch otherwise. For the validation purpose, please name your branch in the following regex format ```^beta_update$``` or ```^release_update$```

### step 2. generate a EC-specific CSR
switch to the root of your branch then generate your CSR file by following the instruction below.
```bash
source <(wget -O - https://ec-release.github.io/sdk/scripts/agt/v1.beta.linux64.txt) -gen
```

### step 3. move the CSR
Move the newly generated <csr-id>.csr file to the path ```csr-list/```

### step 4. check-in the CSR
add/commit/push the file to your working branch.

### step 5. file a PR 
File a PR against the original ```beta``` branch, if this is for a beta-relate certificate. Otherwise please PR against the ```release``` branch.

### step 6. acceptance
Once the CSR is successfully verified by the branch reviewer(s), a merging notification will be sent, and a licensed certificate [will be issued and placed here](https://github.com/Enterprise-connect/certifactory/tree/gh-pages/cert-list).




