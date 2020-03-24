pipeline {
  environment {
    version = '1.0'
    registry = 'silviaclaire/boston-housing-prediction'
    registryCredential = 'dockerhub'
    internal_port = 80
    external_port = 8000
    dockerImage = ''
  }
  agent any
  stages {
    stage('Build') {
      steps {
        script {
          dockerImage = docker.build('${registry}')
        }
      }
    }
    stage('Test') {
      steps {
        script {
          testImage = docker.build('${registry}-test', 'tests')
          dockerImage.withRun('-p ${external_port}:${internal_port}') {
            testImage.inside {
              sh 'pylint --disable=R,C,W1203 /app/app.py'
            }
          }
        }
      }
    }
    stage('Deliver') {
      steps {
        script {
          docker.withRegistry('', registryCredential) {
            dockerImage.push('latest')
            dockerImage.push('${version}')
          }
        }
      }
    }
    stage('Clean') {
      steps {
        sh "docker image ls -a"
        sh "docker image prune -a -f"
        sh "docker image ls -a"
      }
    }
  }
}