#init.pp

class factsdir ( $static_facts = {},
                 $exec_facts = {},
		 ) {

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
  validate_hash($static_facts)
  create_resources(factsdir::static_fact, $static_facts)
  validate_hash($exec_facts)
  create_resources(factsdir::exec_fact, $exec_facts)

}
