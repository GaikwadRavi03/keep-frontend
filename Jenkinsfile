pipeline { 
    agent any 
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('package creation') { 
            steps { 
                sh ''' #!/bin/bash
                cd /var/lib/jenkins/workspace/
                rsync -avzP -e 'ssh -i /my-mumbai-key.pem' /var/lib/jenkins/workspace/docker-web ubuntu@13.126.93.57:/home/ubuntu/
                echo ===> package creation on frontend server
                '''
            }
        }
        stage('Build') { 
            steps { 
                sh ''' #!/bin/bash
                ssh -i /my-mumbai-key.pem ubuntu@13.126.93.57 'sudo rm -rf /home/ubuntu/keep-frontend'
                ssh -i /my-mumbai-key.pem ubuntu@13.126.93.57 'mv /home/ubuntu/docker-web /home/ubuntu/keep-frontend'
                ssh -i /my-mumbai-key.pem ubuntu@13.126.93.57 'bash /home/ubuntu/buildJenkis.sh'
                ssh -i /my-mumbai-key.pem ubuntu@13.126.93.57 'bash /home/ubuntu/dockerBuild.sh'
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
                ssh -i /my-mumbai-key.pem ubuntu@13.126.93.57 'bash /home/ubuntu/deployJenkins.sh'
                echo ===> deploy stage
                '''
            }
        }
    }
}
