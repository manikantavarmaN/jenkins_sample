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
                        sh 'scp /home/ubuntu/samplejava/HelloWorld.jar ubuntu@35.91.117.57:/home/ubuntu/samplejava/'
                        sh 'ssh -v ubuntu@35.91.117.57'
                        sh 'java -jar HelloWorld.jar'


                    } else {
                        error "Invalid environment selected"
                    }
                }
            }
        }
    }
}
