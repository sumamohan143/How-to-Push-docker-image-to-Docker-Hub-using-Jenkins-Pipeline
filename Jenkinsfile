#!/bin/bash
pipeline{

	agent {label 'docker'}

	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub')
	}

	stages {
	    
	    /*stage('gitclone') {

			steps {
				git 'https://github.com/shazforiot/nodeapp_test.git'
			}
		}*/

		stage('Build') {

			steps {
				sh 'sudo docker build -t sumamohan143/nodeapp_test:latest . 2>&1'
			}
		}

		stage('Login') {

			steps {
				sh 'sudo echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'sudo docker push sumamohan143/nodeapp_test:latest'
			}
		}
	}

	post {
		always {
			sh 'sudo docker logout'
		}
	}

}
