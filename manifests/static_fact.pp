#static_fact.pp

define factsdir::static_fact ( $key = $title,
                               $value ) {

 concat::fragment { "$title":
   target => "/etc/facter/facts.d/factsdir.txt",
   content => template('factsdir/factsdir.txt.erb'),
   order => '10',
 }

}
