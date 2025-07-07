# Puppet script to configure SSH client

file_line { 'Declare identity file':
  path  => '/home/vagrant/.ssh/config',
  line  => 'IdentityFile ~/.ssh/school',
  match => '^IdentityFile',
}

file_line { 'Turn off passwd auth':
  path  => '/home/vagrant/.ssh/config',
  line  => 'PasswordAuthentication no',
  match => '^PasswordAuthentication',
}
