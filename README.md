[![Build Status](https://travis-ci.com/Enterprise-connect/certs.svg?branch=beta)](https://travis-ci.com/Enterprise-connect/certs)

# certs
The certifactory that hosts the list of public x509 certificates/CSRs signed and issued by EC CAs.

## request beta license certificate
Whilst openssl is availble as an option to generate CSRs, it is highly recommended to follow the steps below to simplify the request.

#### generate a CSR
```bash
#generate a EC-specific CSR
bash <(curl -s https://enterprise-connect.github.io/oci/k8s/conf.txt) -gen

#move the generated <csr-id>.csr to the path csr-list/

#add/commit the csr file w/ the commit message in this format "<csr-id>" 

#file a PR against the beta branch, or if you would like to receive a release license, file against the release branch

#tbc
```

#### get the certificate
Your signed license certificate will be published in the folder ```cert-list/``` you should receive a ```<cert-id>```, and a URL to the certificate via email.




