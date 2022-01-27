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
        stage('Build  docker image') {
            steps {
                script{
                echo 'Building docker image ....  '
                    sh' docker build -t  mouaddocker/java-repository:jma-1.0 . '
                    }   
                    }        
            }
            stage('Deploy to dockerhub') {
            steps {
                script{
                    withCredentials([usernamePassword(credentialsId:'docker-hub',
                passwordVariable: 'PASS',
                usernameVariable: 'USER')]){
                    sh" docker login -u $USER -p $PASS "
                    echo " Deploying to Dockerhub...."
                    sh' docker push mouaddocker/java-repository:jma-1.0'
                
                        }        
                    }
            
                }     
            }
    
        stage('deploy to k8s') {
            steps {
                sshagent(['k8-ssh-ubuntu-docker']) {
                    sh " scp   java-maven-deployment.yml mouad@192.168.1.106:/home/mouad/Documents/k8-java-maven"
                    
                    script {
                        try{
                            sh "ssh mouad@192.168.1.106 cd /home/mouad/Documents/k8-java-maven"
                            sh "ssh mouad@192.168.1.106 kubectl apply -f /home/mouad/Documents/k8-java-maven/java-maven-deployment.yml"
                        }catch(error){
                            
                        }
                    }
                }
            }
        }
            
            
            
            
            
            
            
            
            
            
            
            
            
    }
    
    
}
       
