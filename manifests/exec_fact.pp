#exec_fact.pp

define factsdir::exec_fact ( $content = '',
                             $filename = "$title.sh",
                           ) {

  file { "/etc/facter/facts.d/$filename":
    owner => root, group => root, mode => 555,
    content => $content,
  }

}
