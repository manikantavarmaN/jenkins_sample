pipeline {
    agent any
    
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'prod'], description: 'Select the environment')
    }

    environment {
        registry  = "anildockerpractice"
        imageName  = "myubuntu"
        imageTag  = "latest"  
        DOCKERHUB_CREDENTIALS=credentials('dockerhub_id')  
        }
    
    stages {
        stage('gitclone') {
            steps {
               sh 'rm -rf jenkins_sample'
               sh 'git clone -b $Branch "https://github.com/anilgitpractice/jenkins_sample.git"'
            }
        }
        stage('Build') {
            steps {
                // Perform build steps
               sh 'docker build -t $registry/$imageName:$imageTag .'
               sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
               sh 'docker push $registry/$imageName:$imageTag'
            }
        }
        
        
        
        stage('Deploy') {
            steps {
                script {
                    if (params.ENVIRONMENT == 'dev') {
                        // Deploy to dev environment
                        sh 'echo "Deploying to dev environment"'
                        // Additional dev-specific steps
                        // Execute Docker commands
                        sh 'docker pull $registry/$imageName:$imageTag'
                        sh 'docker run $registry/$imageName:$imageTag'


                    } else if (params.ENVIRONMENT == 'prod') {
                        // Deploy to prod environment
                        sh 'echo "Deploying to prod environment"'
                        // Additional prod-specific steps
             steps {
                // Copy the .jar file to the remote machine using SSH
                // Replace the placeholders with your actual remote machine details
               


                    } else {
                        error "Invalid environment selected"
                    }
                }
            }
        }
    }
}
