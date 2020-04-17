pipeline {
  agent {
    docker {
      image 'python:3.6'
    }

  }
  stages {
    stage('Build') {
      steps {
        sh '''python --version
python3 --version'''
      }
    }

  }
}