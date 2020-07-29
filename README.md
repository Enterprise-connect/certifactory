[![Build Status](https://travis-ci.com/Enterprise-connect/certs.svg?branch=beta)](https://travis-ci.com/Enterprise-connect/certs)

# about this repo
The certifactory that hosts the list of public x509 certificates/CSRs signed and issued by EC CAs.

## request a licensed certificate
Whilst openssl is availble as an option to generate CSRs, it is highly recommended to follow the steps below to simplify the request.

## generate a CSR

### step 1. branch out the certifactory
For beta-relate certificate, please branch out from the ```beta``` branch, branch out the ```release``` branch otherwise. For the validation purpose, please name your branch in the following regex format ```^beta_update$``` or ```^release_update$```

### step 2. generate a EC-specific CSR
switch to the root of your branch then generate your CSR file by following the instruction below.
```bash
bash <(curl -s https://enterprise-connect.github.io/oci/k8s/conf.txt) -gen
```

### step 3. move the generated .csr file 
Move the newly generated <csr-id>.csr file to the path ```csr-list/```

### step 4. ccheck-in the file
add/commit/push the file to your working branch.

### step 5. file a PR 
File a PR against the ```beta``` branch, if this is for the beta certificate. Otherwise please PR against the ```release``` branch.

### step 6. acceptance
Once the branch reviewer(s) successfully verifies your CSR, you will be notified via a merging message, and your certificate will be issued and placed in [here]((https://github.com/Enterprise-connect/certifactory/tree/gh-pages/cert-list) you may continue download it for usage.




