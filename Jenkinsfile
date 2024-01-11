pipeline {
    agent any

    environment {
        TF_CLI_ARGS = '-no-color'
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    withCredentials([aws(credentialsId: 'AWS_CRED', accessKeyVariable: 'AKIASHQ2SLGDZYUQ7SU6 ', secretKeyVariable: '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')]) {
                        sh 'terraform init'
                        sh 'terraform plan -out=tfplan'
                    }
                }
            }
        }

        stage('Terraform Apply') {
            when {
                expression { env.BRANCH_NAME == 'main' }
                expression { currentBuild.rawBuild.getCause(hudson.model.Cause$UserIdCause) != null }
            }
            steps {
                script {
        //             // Ask for manual confirmation before applying changes
                    input message: 'Do you want to apply changes?', ok: 'Yes'
                    withCredentials([aws(credentialsId: 'AWS_CRED', accessKeyVariable: 'AKIASHQ2SLGDZYUQ7SU6', secretKeyVariable: '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')]) {
                        sh 'terraform init'
                        sh 'terraform aply -out=tfplan'
                    }
                }
            }
        }
    }
}