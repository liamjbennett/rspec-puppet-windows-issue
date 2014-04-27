
class windows { 

  file {'foo': 
    path    => 'C:\foo.txt',
    content => 'foo contains bar!',
    ensure  => present
  }

}
