pipeline {
    agent any
    environment {
        registry  = "anildockerpractice"
        imageName  = "myubuntu"
        imageTag  = "latest"
	DOCKERHUB_USERNAME = "anildockerpractice"
	DOCKERHUB_PASSWORD = "Anil@docker123"
	    
        }
	
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $registry/$imageName:$imageTag .'
            }
        }
        
        stage('Publish') {
            steps {
                    sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'docker push $registry/$imageName:$imageTag'
                
            }
        }
    }
}
