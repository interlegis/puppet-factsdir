#init.pp

class factsdir ( $facts = { } ) {

  file { ['/etc/facter','/etc/facter/facts.d']:
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  validate_hash($facts)
  create_resources(factsdir::facts, $facts)

}
