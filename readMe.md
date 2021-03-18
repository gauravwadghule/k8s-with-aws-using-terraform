This terraform script will create cluster in aws.

instance size used - t2.medium

resources will get created - 
2 EC2 instances
security group
vpc

After the execution of this script we will have 2 EC2 instances with kubectl, docker, kubeadm installed

After that you need to initialize the using following command

kubeadm init --pod-network-cidr=10.0.0.0/8

After initializing master node successfully we need to add worker nodes to the cluster.