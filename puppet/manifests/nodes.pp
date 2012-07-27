node 'modules.apache.org' {
# node /^proxy/ {

  group { "puppet":
    ensure => "present",
  }

  Group['puppet'] -> Exec['google-dns'] -> Exec['apt-update']

  exec { 'google-dns':
    command => 'echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null',
    cwd => '/vagrant',
    loglevel => info,
    timeout => 1800,
  }
  
  exec { 'apt-update':
    command => 'sudo /usr/bin/apt-get update',
    loglevel => info,
    timeout => 3600,
  }

  Exec['apt-update'] -> Package <| |>

  package { 
    'build-essential': ensure => "present";
    'checkinstall': ensure => "present";
    'apache2': ensure => "present";
    'apache2-prefork-dev': ensure => "present";
  }

  exec { 'apache2-source':
    command => '/usr/bin/apt-get source apache2',
#    cwd => '/vagrant',
    loglevel => info,
    timeout => 1800,
  }

  service { 'apache2':
    ensure => running,
    require => Package['apache2'],
  }

}

