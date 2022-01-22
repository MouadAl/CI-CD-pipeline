pipeline {
    agent any

    tools{
        maven 'maven-3.8.3'
    }

    stages {
        stage('Checking out'){
            steps{
                git 'https://github.com/MouadAl/CI-CD-pipeline.git'
            }
        }
         stage('Build jar') {
            steps {
                script{
                echo 'Building the app..... '
                sh 'mvn package install'
                }        
            }
            
         }
        stage('Build  docker image  && deploy') {
            steps {
                script{
                echo 'Building docker image ....  '
                withCredentials([usernamePassword(credentialsId:'docker-hub',
                passwordVariable: 'PASS',
                usernameVariable: 'USER')]){
                    sh' docker build -t  mouaddocker/java-repository:jma-1.0 . '
                    sh" docker login -u $USER -p $PASS "
                    echo " Deploying to Dockerhub...."
                    sh' docker push mouaddocker/java-repository:jma-1.0'
                    
                                        }   
                    }        
                }
            }
    }
    
    
}
       
