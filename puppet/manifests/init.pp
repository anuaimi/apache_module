  group { "puppet":
    ensure => "present",
  }

  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }

  Exec['apt-update'] -> Package <| |>

  package { 'apache2-prefork-dev':
    ensure => "present",
  }