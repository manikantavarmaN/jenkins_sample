pipeline {
    agent any
    environment {
        REGISTRY = "anildockerpractice"
        IMAGENAME = "myubuntu"
        IMAGETAG = "latest"
        }
	
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t $REGISTRY/$IMAGENAME:$IMAGETAG .'
            }
        }
        
        stage('Publish') {
            steps {
                withDockerRegistry([credentialsId: 'docker-credentials', url: "https://hub.docker.com/u/anildockerpractice"]) {
                    sh 'docker push $REGISTRY/$IMAGENAME:$IMAGETAG'
                }
            }
        }
    }
}
