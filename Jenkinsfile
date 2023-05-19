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
                sh ' sudo docker build -t $registry/$imageName:$imageTag .'
            }
        }
        
        stage('Publish') {
            steps {
                    sh 'sudo docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                    sh 'sudo docker push $registry/$imageName:$imageTag'
                
            }
        }
    }
}
