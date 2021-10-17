# django_todo
Django-Todo App
A web app built on the Django framework and MySQL database to store todo lists.

PRs Welcome

Requirements
Python (3.4+)
Django
mysql-server
Usage
Install pip3
sudo apt-get install python3-pip

Install django
sudo pip3 install django

Install mysql-server
sudo apt-get install mysql-server

Change your mysql-server password in settings.py

Install python3 client for MySQL
sudo apt-get install python3-mysqldb

Start mysql in terminal to CREATE a database named todolist
sudo mysql -u root -p
CREATE DATABASE todolist;
Create table inside the database
python3 manage.py migrate

Run the app using the following command:
python3 manage.py runserver

Navigate to localhost://8000 on your favourite browser to see the app in action.

#EKS-Fargate-Cluster-and-Managed-Node-Group-Using-Terraform

EKS Cluster core components are:

EKS control plane

Worker nodes and node groups

Fargate profiles

VPC

Note: Fargate profile can be created only if your vpc has a minimum of one private subnets.

Tech stacks needed to manage kubernetes deployment:

AWS CLI
Eksctl
Helm
Kubelet
Docker
Terraform
Bash Scripting
To install or upgrade eksctl on Linux using curl

Download and extract the latest release of eksctl with the following command:

curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
move the extracted binary to /usr/local/bin
sudo mv /tmp/eksctl /usr/local/bin
Test that your installation was successful with the following command:

eksctl version
Connect to my cluster:

eksctl get cluster
eksctl get nodegroup cluster=eks-cluster
kubectl get ns
kubectl get svc
kubectl get pods
kubectl get deployments
Add the following plugins to Jenkins server:

ECR
Docker pipeline
Docker plugin
Kubernetes continuous deploy plugin
Create credentials for connecting to ECR on Jenkins server using AWS security credentials (Access key and secret key ID )

Create credentials for connecting to kubernetes in Jenkins server and copy all the content of ( sudo cat ~/.kube/config ) from the EKS Cluster inside it as enter directly, ID: k8s , Description: k8s .

Set a Clusterrole as cluster-admin in your eks cluster : kubectl create clusterrolebinding cluster-system-anonymous --cluster-role=cluster-admin --user=system:anonymous

How does Amazon EKS work?

![image](https://user-images.githubusercontent.com/59709429/137639043-72c23a66-c799-4e23-bf23-eb64754d401e.png)
