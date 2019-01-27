pipeline {
    agent any
    stages {
        stage('Build'){
            steps {
                echo "${env.BUILD_ID}"
                bat 'mvn clean package'
                bat "docker build . -t tomcatwebapp:${env.BUILD_ID}"
            }
        }
    }
}