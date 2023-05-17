pipeline {
    agent any
    
    environment {
        REGISTRY = "anildockerpractice"
        IMAGENAME = "myubuntu"
        IMAGETAG = "latest"
		DOCKERHUB_CREDENTIALS = "mydocker-credentials"
    }
	
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $REGISTRY/$IMAGENAME:$IMAGETAG .'
            }
        }
        
        stage('Publish') {
            steps {
                withDockerRegistry([credentialsId: 'DOCKERHUB_CREDENTIALS',]) {
                    sh 'docker push $REGISTRY/$IMAGENAME:$IMAGETAG'
                }
            }
        }
    }
}
