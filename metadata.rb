name             'docker_registry_2'
maintainer       'Alexandr Lispython'
maintainer_email 'alex@obout.ru'
license          'All rights reserved'
description      'Installs/Configures docker registry 2.0'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "docker", "~> 0.37.1"
depends "openssl", "~> 4.0.0"
