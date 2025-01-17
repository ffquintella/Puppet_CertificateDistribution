# Class Certificate_distribution::Params
#
# Defaults variables
class certificate_distribution::params {
  $certificate_list = ['test.cacert.pem']
  $content = '###CA###'

  case $facts['os']['name'] {
    'RedHat', 'CentOS', 'OracleLinux', 'Rocky', 'Fedora': {
      $certificate_dir = '/etc/pki/ca-trust/source/anchors/'
      $trust_command = 'update-ca-trust extract'
    }
    'Debian', 'Ubuntu': {
      $certificate_dir = '/usr/local/share/ca-certificates/'
      $trust_command = 'update-ca-certificates'
    }
    default:            {
      fail("${facts['os']['name']} not supported")
      }
  }

}
