pipeline {
    agent any
    stages{
        stage('Build'){
            steps {
                bat('mvn clean package')
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage ('Deploy to Staging'){
            steps {
                build job: 'Deploy-to-staging'
            }
        }
        stage('Deploy to Production'){
            steps {
                timeout(time:5, unit:'DAYS'){
                    input message:'Approve PRODUTION Deployment?'
                }

                build job: 'deploy-to-prod'
            }
            post {
                success {
                    echo 'Code deployed to Prodution'
                }
                failure{
                    echo 'Deployment failed'
                }
            }
        }
    }
}
