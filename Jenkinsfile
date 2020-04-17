pipeline {
  agent any
  stages {
    stage('Build') {
      agent {
        docker {
          image '3.6'
        }
      }
      steps {
        sh 'virtualenv'
      }
    }

  }
}
