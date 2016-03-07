node default {
  class { 'firewall': }
  firewall { '100 allow http on port 8080':
    dport  => [ 8080 ],
    proto  => tcp,
    action => accept,
  }

  class { 'jenkins': }
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


