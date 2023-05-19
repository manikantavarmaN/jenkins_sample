pipeline {
    agent any
    environment {
        registry  = "anildockerpractice"
        imageName  = "myubuntu"
        imageTag  = "latest"  
        DOCKERHUB_CREDENTIALS = credentials('dockerhub_jenkins')  
        }
	
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $registry/$imageName:$imageTag .'
            }
        }
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push $registry/$imageName:$imageTag'
            }
        }
    }
    post {
        always {
            sh ' docker logout'
        }
    }
}
