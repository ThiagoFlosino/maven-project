pipeline {
    agent any
    stages{
        stage('Build'){
            if (isUnix()) {
                sh "mvn clean packege"
            } else{
                bat('mvn clean package')
            }
        }
    }
}