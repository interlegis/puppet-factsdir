#fact.pp

define factsdir::fact ( $key = $title,
                        $value ) {

 concat::fragment { "$title":
   target => "/etc/facter/facts.d/factsdir.txt",
   content => template('factsdir/factsdir.txt.erb'),
   order => '10',
 }

}
