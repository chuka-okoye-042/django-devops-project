pipeline {
  agent any

  environment {
    IMAGE_NAME = "chuka042/django-devops-project"
  }

  stages {
    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        bat "docker build -t %IMAGE_NAME% ."
      }
    }

    stage('Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-cred-1', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          bat """
          docker login -u %DOCKER_USER% -p %DOCKER_PASS%
          docker push %IMAGE_NAME%
          """
        }
      }
    }

    stage('Post Build') {
      steps {
        echo "Docker image pushed: ${env.IMAGE_NAME}"
      }
    }
  }

  triggers {
    pollSCM('H/2 * * * *') // Poll GitHub every 2 minutes
  }
}
