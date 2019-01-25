pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                if (isUnix()) {
                    sh "mvn clean packege"
                } else{
                    bat('mvn clean package')
                }
            }
        }
    }
}