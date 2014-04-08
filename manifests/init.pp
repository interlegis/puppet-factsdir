#init.pp

class factsdir ( $facts = { } ) {

  # Create required directories
  file { ['/etc/facter','/etc/facter/facts.d']:
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0644',
  }

  # Set up configuration file
  concat { "/etc/facter/facts.d/$title.txt":
    owner          => 'root',
    group          => 'root',
    mode           => '0444',
  }

  concat::fragment { "$title-header":
    target => "/etc/facter/facts.d/$title.txt",
    content => '# External facts file managed by Puppet
',
    order => '01',
  }

  # Create facts
  validate_hash($facts)
  create_resources(factsdir::fact, $facts)

}
