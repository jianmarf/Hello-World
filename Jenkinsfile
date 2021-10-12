def envConnect(environment) {
  switch (environment) {
    case 'sbdev':
      bastionName = 'sbdev-bastion'
      break
    case 'sitebuilder':
      bastionName = 'sitebuilder-bastion'
      break
  }
}

pipeline {
  agent any
  environment {
    sshSocket = 'kube.sock'
  }

  stages {
    stage('Stage 1') {
      steps {
        echo 'Hello world!'
      }
    }
    stage('DeplySBDEV') {
      input message: 'Proceed to SBDev' 
      envConnect('sbdev')
      echo $bastionName
    }
    stage('DeploySiteBuilder') {
      input message: 'Process to SiteBuilder'
      envConnect('sitebuilder')
      echo $bastionName
    }
  }
}    
