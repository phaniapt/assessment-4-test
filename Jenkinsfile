pipeline {
    agent any
        environment {
        // ECR_REPO = "my-ecr-repo-65"
        // ECR_URL = "240680229609.dkr.ecr.ap-south-1.amazonaws.com/my-ecr-repo-65"
        // AWS_ACC_ID ='240680229609'
    }
    stages {
        stage('getCode'){
            steps {
                deleteDir()
                git branch: 'main', credentialsId: 'github-phani-credentails', url: 'https://github.com/phaniapt/assessment-4-test.git'
            }
        }
        stage('create ecr repo'){
            steps {
                script {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: "aws-credentials-phani",
                        accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                        secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']
                    ]) {
                        sh """
                            pwd
                            terraform init
                            terraform plan  
                            terraform apply -auto-approve
                        """
                    }
                }
            }
        }
        stage('Build'){
            steps {
                script {
                    app = docker.build("${ECR_URL}/${ECR_REPO}" + ":${BUILD_NUMBER}")
                }
            }
        }
         stage('UploadToECR'){
            steps {
                script {
                    withDockerRegistry(
                        credentialsId: 'ecr:ap-south-1:aws-credentials-phani',
                        url: "https://${env.AWS_ACC_ID}.dkr.ecr.ap-south-1.amazonaws.com") {
                            app.push("${env.BUILD_NUMBER}")
                    }
                    sh '''
                    docker images
                    '''
                }
            }
        }
    }
}
