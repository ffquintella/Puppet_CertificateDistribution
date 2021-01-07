# Certificate_distribution::Certificate
#
# Used to deploy a certificate, should not be called directly
#
define certificate_distribution::certificate (
	String $source = '', 
	String $content = '', 
	String $type = 'content'
 ) {

	file { "certificate ${name}":
    ensure => file,
    path   => "${certificate_distribution::certificate_dir}${name}",
    content => "${content}",
    notify => Exec['update ca-trust'],
	}
	
	
}
