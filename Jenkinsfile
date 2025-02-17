pipeline {
    agent any

    stages {
        stage('Cloning Repo') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/mletre/migtf.git']])
            }
        }
        stage('Cppy File To Master') {
            steps {
                sh 'scp html/* autouser@192.168.200.10:/var/www/html'
            }
        }

        stage('Turn OFF Master Instance') {
            steps {
               script {
                    withCredentials([file(credentialsId: 'eb9bfa3f-880d-49a0-9da2-939f176e6b36', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                        sh 'gcloud auth activate-service-account --project=dla-infra-team-sandbox --key-file=$GOOGLE_APPLICATION_CREDENTIALS'
                        sh 'gcloud compute instances stop instance-nginx --zone=asia-southeast2-b'
                    }
                }
            }
        }
        stage('Update Instance Template') {
            steps {
               script {
                    withCredentials([file(credentialsId: 'eb9bfa3f-880d-49a0-9da2-939f176e6b36', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
                        sh 'export TF_VAR_service_account_key=$GOOGLE_APPLICATION_CREDENTIALS'
                        sh 'terraform -chdir=terraform init'
                        // sh 'terraform -chdir=terraform random_string.instance_name'
                        // sh 'terraform -chdir=terraform apply -auto-approve'
                    }
                }
            }
        }
    }
}
