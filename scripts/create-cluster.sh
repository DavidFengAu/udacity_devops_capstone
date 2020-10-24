eksctl create cluster --name=my-cluster --version=1.18 --region=us-east-1 --node-type=t2.medium
aws eks --region us-east-1 update-kubeconfig --name my-cluster