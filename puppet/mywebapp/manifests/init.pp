class mywebapp {


  $servername = hiera('mywebapp::servername')
  $username = hiera('mywebapp::username')
  $password = hiera('mywebapp::password')
  $dbname = hiera('mywebapp::dbname')




  package {'httpd':
    ensure   => installed,
    provider => yum,
  }


  package {['php', 'php-common', 'php-opcache', 'php-mcrypt', 'php-cli', 'php-gd', 'php-curl', 'php-mysqlnd']:
    ensure   => installed,
    provider => yum,
  }


  file {'/var/www/html/index.php':
    ensure => file,
    content => template('mywebapp/index.php.erb'),
    mode   => '0777',
  }
  file {'/var/www/html/insert.php':
    ensure => file,
    content => template('mywebapp/insert.php.erb'),
    mode   => '0777',
  }








}