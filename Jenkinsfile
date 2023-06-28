pipeline {
    agent any
    stages{
        stage('ECR creation') {
            steps {
                sh "terraform init"
                sh "terraform apply -auto-approve"
            }
        }
        // stage('Docker build') {
        //     steps {
        //         sh 'docker build -t my-testecr-assessment-4 .'
        //     }
        // }
        // stage('image pushing') {
        //     steps {
        //         sh ""
        //     }
        // }
    }
}
