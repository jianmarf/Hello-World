def envConnect(environment) {
  switch (environment) {
    case 'sbdev':
      bastionName = 'sbdev-bastion'
      break
    case 'sitebuilder':
      bastionName = 'sitebuilder-bastion'
      break
  }
  echo $bastionName
  echo $sshSocket
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
      steps {
        input message: 'Proceed to SBDev' 
        envConnect('sbdev')
        echo $sshSocket
      }
    }
    stage('DeploySiteBuilder') {
      steps {
        input message: 'Process to SiteBuilder'
        envConnect('sitebuilder')
        echo $sshSocket
      }
    }
  }
}    
