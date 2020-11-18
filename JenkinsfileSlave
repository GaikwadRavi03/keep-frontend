pipeline { 
    agent { label 'slave 1' }
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('package creation') { 
            steps { 
                sh ''' #!/bin/bash
                cd /var/lib/jenkins/workspace/
                rsync -avzP -e 'ssh -i /my-mumbai-key.pem' /var/lib/jenkins/workspace/keep-frontend-pipeline ubuntu@13.232.87.186:/home/ubuntu/
                echo ===> package creation on frontend server
                '''
            }
        }
        stage('Build') { 
            steps { 
                sh ''' #!/bin/bash
                ssh -i /my-mumbai-key.pem ubuntu@13.232.87.186 'sudo rm -rf /home/ubuntu/keep-frontend'
                ssh -i /my-mumbai-key.pem ubuntu@13.232.87.186 'mv /home/ubuntu/keep-frontend-pipeline /home/ubuntu/keep-frontend'
                ssh -i /my-mumbai-key.pem ubuntu@13.232.87.186 'bash /home/ubuntu/buildJenkis.sh'
                echo ===> Build stage
                '''
            }
        }
        stage('Test') { 
            steps {
                sh 'echo test case runs' 
            }
        }
        stage('deploy') { 
            steps {
                sh ''' #!/bin/bash
                ssh -i /my-mumbai-key.pem ubuntu@13.232.87.186 'bash /home/ubuntu/deployJenkins.sh'
                echo ===> deploy stage
                '''
            }
        }
    }
}
