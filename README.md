# Certificate Distribution 
[![Build Status](https://travis-ci.org/sjors101/Puppet_CertificateDistribution.svg?branch=master)](https://travis-ci.org/sjors101/Puppet_CertificateDistribution)
This is the certificate_distibution module. This module manages certificate_distibution for RHEL.

Tested on...

 * RHEL 6
 * RHEL 7
 * RHEL 8
 * RHEL 9
 * Debian 9

The module also works on Oracle Linux, Rocky Linux and Fedora

## Example usage

For easy contribution you can add the certificate to the files folder of this module, but it is beter to use a custom folder. For example in your profile folder.
The certificates that are included in the files folder and the $certifcates_list in params.pp are distributed to the assigned machines.
The name in the $certificate_list must be the same as the pem file.<br><br>
Example:

1. add the PEM file the the profile/files/<br>
test.cacert.pem

2. add the new certificate to the params.pp<br>
$certificate_list = ["test.cacert.pem"] 

OR even better!

Call the module (RedHat / CentOS):

Note that for RedHat family the file extension should be '.pem':

```
class {'certificate_distribution':
  certificate_list => ['cachain.pem'],
  content           => '###CA###'
}
```

For Debian family the file extension should be '.crt'

```
class {'certificate_distribution':
  certificate_list => ['cachain.crt'],
  content           => '###CA###'
}
```
