

# for puppet master --compile  which works
node 'foo' { include windows } 

# because once a node def is in here rspec-puppet fails not able to find a node
node default { 
  #  quet
}
