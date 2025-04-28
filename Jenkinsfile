pipeline {
    agent any

        environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {
        
       
        stage('Docker Build') {
            steps {
                sh "docker build . -t hiring-app:$BUILD_NUMBER"
            }
        }
      stage('Push to DockerHub') {
            environment {
                DOCKERHUB_CREDENTIALS = credentials('docker')  // 'docker' is the credential ID
            }
            steps {
                sh """
                    echo \$DOCKERHUB_CREDENTIALS_PSW | docker login -u \$DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker tag hiring-app:$BUILD_NUMBER ab002/tomcat:$BUILD_NUMBER
                    docker push ab002/tomcat:$BUILD_NUMBER
                """
            }
        }
       
        }
} 
