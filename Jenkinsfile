pipeline {
    agent any
    environment {
        registry  = "anildockerpractice"
        imageName  = "myubuntu"
        imageTag  = "latest"
        }
	
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $registry/$imageName:$imageTag .'
            }
        }
        
        stage('Publish') {
            steps {
                withDockerRegistry([credentialsId: 'jenkins-docker-credentials', url: 'http://anildockerpractice']) {
                    sh 'docker push $registry/$imageName:$imageTag'
                }
            }
        }
    }
}
