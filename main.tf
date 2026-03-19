pipeline {
    agent any

    stages {
        stage('PULL') {
            steps {
                timeout(time: 30, unit: 'MINUTES') {
                    git branch: 'main', url: "https://github.com/himanshupotpose/cbz-infra-ec2.tf.git"
                }
            }
        }
        stage('INIT') {
            steps {
                timeout(time: 30, unit: 'MINUTES') {
                    sh 'terraform init'
                }
            }
        }

        stage('PLAN') {
            steps {
                timeout(time: 30, unit: 'MINUTES') {
                    sh 'terraform plan'
                }
            }
        }

        stage('APPLY') {
            steps {
                timeout(time: 30, unit: 'MINUTES') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}