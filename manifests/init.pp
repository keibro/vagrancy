exec { "apt-get update":
  path => "/usr/bin",
} ~>
package { "git":
  ensure  => present,
  require => Exec["apt-get update"],
} ~>
package { "vim":
  ensure  => present,
  require => Exec["apt-get update"],
} ~>
package { "make":
  ensure  => present,
  require => Exec["apt-get update"],
} ~>
package { "g++":
  ensure  => present,
  require => Package["make"],
} ~>
package { "curl":
  ensure  => present,
  require => Exec["apt-get update"],
} ~>
package { "ruby":
  ensure  => absent,
  require => Exec["apt-get update"],
} ~>
package { "ruby1.9.1":
  ensure  => present,
  require => Package["ruby"],
} ~>
package { "ruby1.9.1-dev":
  ensure  => present,
  require => Package["ruby"],
} ~>
package { "xvfb":
  ensure  => present,
  require => Exec["apt-get update"],
} ~>
package { "firefox":
  ensure  => present,
  require => Exec["apt-get update"],
}

# Cucumber Testing
package { 'cucumber':
    ensure   => 'installed',
    provider => 'gem',
    require => Package["ruby1.9.1-dev"],
}
package { 'rspec':
    ensure   => 'installed',
    provider => 'gem',
    require => Package["ruby1.9.1-dev"],
}
package { 'capybara':
    ensure   => 'installed',
    provider => 'gem',
    require => Package["ruby1.9.1-dev"],
}
package { 'selenium-webdriver':
    ensure   => 'installed',
    provider => 'gem',
    require => Package["ruby1.9.1-dev"],
}
package { 'headless':
    ensure   => 'installed',
    provider => 'gem',
    require => Package["ruby1.9.1-dev"],
}
