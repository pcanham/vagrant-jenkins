Yumrepo <| |> -> Package <| |>

# Death to the allow_virtual_packages warning
if versioncmp($::puppetversion,'3.6.1') >= 0 {
  $allow_virtual_packages = hiera('allow_virtual_packages',false)
  Package {
    allow_virtual => $allow_virtual_packages,
  }
}

node default {

  class { 'firewall': }

  class { 'jenkins':
    configure_firewall => true
  }

  jenkins::user { 'johndoe':
    email    => 'jdoe@example.com',
    password => 'changeme',
  }

  jenkins::plugin { 'git': }
  jenkins::plugin { 'promoted-builds': }
  jenkins::plugin { 'maven-plugin': }
  jenkins::plugin { 'javadoc': }
  jenkins::plugin { 'token-macro': }
  jenkins::plugin { 'mailer': }
  jenkins::plugin { 'parameterized-trigger': }
  jenkins::plugin { 'conditional-buildstep': }
  jenkins::plugin { 'subversion': }
  jenkins::plugin { 'mapdb-api': }
  jenkins::plugin { 'bitbucket-oauth': }
  jenkins::plugin { 'ssh-credentials': }
  jenkins::plugin { 'credentials': }
  jenkins::plugin { 'run-condition': }
  jenkins::plugin { 'scm-api': }
  jenkins::plugin { 'multiple-scms': }
  jenkins::plugin { 'git-client': }
  jenkins::plugin { 'rvm': }
  jenkins::plugin { 'python-wrapper': }
  jenkins::plugin { 'ansible': }
  jenkins::plugin { 'job-dsl': }
  jenkins::plugin { 'workflow-step-api': }
  jenkins::plugin { 'aws-codepipeline': }
}


