// pipeline {
//     agent any
//         stage('ECR creation') {
//             steps {
//                 sh "terraform init"
//                 sh "terraform apply -auto-approve"
//             }
//         }
//         // stage('Docker build') {
//         //     steps {
//         //         sh 'docker build -t my-testecr-assessment-4 .'
//         //     }
//         // }
//         // stage('image pushing') {
//         //     steps {
//         //         sh ""
//         //     }
//         // }
// }

pipeline {
    agent any
    stages {
        stage('getCode'){
            steps {
                deleteDir()
                git credentialsId: 'jenkins-master-ssh', url: 'git@github.com:' + env.SPACE + '/' + env.REPO + '.git', branch: env.BRANCH_NAME
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
                        credentialsId: 'ecr:ap-south-1:AWS_SYDHI_UAT',
                        url: "https://${env.AWS_ACC_ID}.dkr.ecr.ap-south-1.amazonaws.com") {
                            app.push("${env.BUILD_NUMBER}")
                    }
                    sh '''
                    docker images
                    docker rmi ${ECR_URL}/${ECR_REPO}:${BUILD_NUMBER}
                    '''
                }
            }
        }
}
}
