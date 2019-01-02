pipeline {
    agent any
    parameters {
        string(name: 'tomcat_dev', defaultValue: '52.67.159.81', description: 'Staging Server')
        string(name: 'tomcat_prod', defaultValue: '52.67.123.185', description: 'Production Server')
    }

    triggers {
        pollSCM('* * * * *')
    }
    stages{
        stage('Build'){
            steps {
                if (isUnix()) {
                    sh "mvn clean packege"
                } else{
                    bat('mvn clean package')
                }
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
                }
            }
        }
        stage ('Deployments'){
            parallel{
                stage ('Deploy to Staging'){
                    steps {
                        if (isUnix()) {
                            sh "scp -i C:\Users\ThiagoLeite\Downloads/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat/webapps"
                        } else {
                            bat("scp -i C:\Users\ThiagoLeite\Downloads/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_dev}:/var/lib/tomcat/webapps")
                        }
                    }
                }

                stage ("Deploy to Production"){
                    steps {
                        if (isUnix()) {
                            sh "scp -i C:\Users\ThiagoLeite\Downloads/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat/webapps"
                        } else {
                            bat("scp -i C:\Users\ThiagoLeite\Downloads/tomcat-demo.pem **/target/*.war ec2-user@${params.tomcat_prod}:/var/lib/tomcat/webapps")
                        }
                    }
                }
            }
        }
    }
}