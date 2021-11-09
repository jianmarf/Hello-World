def envConnect(environment) {
  switch (environment) {
    case 'sbdev':
      bastionName = 'sbdev-bastion'
      break
    case 'sitebuilder':
      bastionName = 'sitebuilder-bastion'
      break
  }
  sh("echo $bastionName")
  sh("echo $sshSocket")
}

def status = [build:[tag:(TAG)]]

def checkoutTag(t) {
  checkout([$class: 'GitSCM', branches: [[ name: "refs/tags/${t}" ]]])
}

def deploy(version) {
  checkoutTag(version)
}

pipeline {
  agent any
  parameters {
    string(name: 'VERSION', description: 'Version / tag to release')
  }
  environment {
    VERSION = "${VERSION}"
    sshSocket = 'kube.sock'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
        checkoutTag(TAG)
        sh 'make release'
      }
    }
    stage('DeplySBDEV') {
      steps {
        input message: 'Proceed to SBDev' 
        envConnect('sbdev')
        sh "echo $sshSocket"
      }
    }
    stage('DeploySiteBuilder') {
      steps {
        input message: 'Process to SiteBuilder'
        envConnect('sitebuilder')
        sh "echo $sshSocket"
      }
    }
  }
}    
