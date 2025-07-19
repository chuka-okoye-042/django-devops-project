pipeline {
  agent any

  environment {
    IMAGE_NAME = "chuka042/django-devops-project"
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
  }

  stages {
    stage('Checkout Code') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Push to DockerHub') {
      steps {
        sh """
          echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
          docker push $IMAGE_NAME
        """
      }
    }

    stage('Post Build') {
      steps {
        echo "Docker image pushed: $IMAGE_NAME"
      }
    }
  }

  triggers {
    pollSCM('H/2 * * * *')  // ✅ Poll GitHub every 2 minutes
  }
}
