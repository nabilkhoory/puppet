class lamp {


# execute 'apt-get update'
exec { 'apt-update':                    # exec resource named 'apt-update'
  command => '/usr/bin/apt-get update'  # command this resource will run
  }

# install apache2 package
package { 'apache2':
  require => Exec['apt-update'],        # require 'apt-update' before installing
    ensure => installed,
    }

# ensure apache2 service is running
service { 'apache2':
  ensure => running,
  }



# install php5 package
package { 'php5':
  require => Exec['apt-update'],        # require 'apt-update' before installing
    ensure => installed,
    }

# ensure info.php file exists
file { '/var/www/html/info.php':
  ensure => file,
    content => '<?php  echo "nabil puppet"; ?>',    # phpinfo code
      require => Package['apache2'],        # require 'apache2' package before creating
      }


}