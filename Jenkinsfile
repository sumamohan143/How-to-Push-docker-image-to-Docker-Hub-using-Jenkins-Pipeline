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
        sh 'sudo docker build -t sumamohan143/mr-alpine:latest .'
      }
    }
    stage('Scan') {
      steps {
        sh 'sudo docker scan sumamohan143/mr-alpine:latest'
      }
    }
    stage('Publish') {
      steps {
        sh '''
          sudo docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW
          sudo docker push sumamohan143/mr-alpine:latest
          sudo docker logout
        '''
      }
    }
  }
}
