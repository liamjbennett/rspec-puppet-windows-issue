
class windows { 

  file {'foo': 
    path => 'blah/de/dah',
    content => 'hi there',
    ensure => present
  }

}
