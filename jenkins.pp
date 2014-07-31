node default {
  class { 'timezone':
    timezone => 'UTC',
  }

  class { 'jenkins':
    plugin_hash => {
      'git'                   => {},
      'promoted-builds'       => {},
      'maven-plugin'          => {},
      'javadoc'               => {},
      'token-macro'           => {},
      'mailer'                => {},
      'parameterized-trigger' => {},
      'conditional-buildstep' => {},
      'subversion'            => {},
      'mapdb-api'             => {},
      'bitbucket-oauth'       => {},
      'ssh-credentials'       => {},
      'credentials'           => {},
      'run-condition'         => {},
      'scm-api'               => {},
      'multiple-scms'         => {},
      'git-client'            => {},
      'rvm'                   => {},
      'python-wrapper'        => {},
      'packer'                => {},
      'thinBackup'            => {}
    }
  }
}


