pipeline {
    agent any
    stage('Build'){
        if (isUnix()) {
            sh "mvn clean packege"
        } else{
            bat('mvn clean package')
        }
    }
}