pipeline {
  agent { label 'docker' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t sumamohan143/mr-alpine:latest .'
      }
    }
    stage('Scan') {
      steps {
        sh 'docker scan sumamohan143/mr-alpine:latest'
      }
    }
    stage('Publish') {
      steps {
        sh '''
          docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW
          docker push sumamohan143/mr-alpine:latest
          docker logout
        '''
      }
    }
  }
}
