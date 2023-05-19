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
                withDockerRegistry([credentialsId: 'docker-credentials', url: registry]) {
                    sh 'docker push $registry/$imageName:$imageTag'
                }
            }
        }
    }
}
