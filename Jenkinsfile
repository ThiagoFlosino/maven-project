pipeline {
    agent any
    stages {
        stage('Build'){
            steps {
                bat 'mvn clean package'
                bat "docker build . -t tomcatwebapp:VERSAO_${env.BUILD_ID}"
            }
        }
    }
}