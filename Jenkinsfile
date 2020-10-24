pipeline {
     agent any
     stages {
         stage('Lint') {
              steps {
                  sh 'tidy -q -e **/*.html'
              }
         }
         stage('Build Docker Image') {
              steps {
                  echo 'Building Docker Image...'
                  sh 'docker build -t udacity-cloud-devops-capstone .'
              }
         }
         stage('Push Docker Image') {
              steps {
                  echo 'Pushing Docker Image...'
                  withDockerRegistry([url: "", credentialsId: "dockerhub"]) {
                      sh "docker tag udacity-cloud-devops-capstone fatmonitor/udacity-cloud-devops-capstone"
                      sh 'docker push fatmonitor/udacity-cloud-devops-capstone'
                  }
              }
         }
         stage('Deploy Container') {
              steps{
                  echo 'Deploying to AWS...'
                  withAWS(credentials: 'junjiefeng', region: 'us-east-1') {
                      sh "aws eks --region us-east-1 update-kubeconfig --name my-cluster"
                      sh "kubectl config use-context arn:aws:eks:us-east-1:124647807645:cluster/my-cluster"
                      sh "kubectl apply -f controller/deployment.yml"
                      sh "kubectl apply -f controller/service.yml"
                      sh "kubectl set image deployments/udacity-capstone-deploy udacity-capstone-deploy=fatmonitor/udacity-cloud-devops-capstone:latest"
                      sh "kubectl get deployments"
                      sh "kubectl get pod"
                  }
              }
        }
        stage("Cleaning up") {
              steps{
                    sh "docker system prune"
              }
        }
     }
}