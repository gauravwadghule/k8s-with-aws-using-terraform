
resource "aws_instance" "master-k8" {
  ami           = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"
  key_name = "coda-k8-ec2"
  security_groups = [aws_security_group.k8_sg.name]
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo -i
                  apt-get update
                  swapoff -a
                  apt-get update && apt-get install -y apt-transport-https curl
                  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
                  cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
                  deb https://apt.kubernetes.io/ kubernetes-xenial main
                  EOF
                  apt-get update
                  apt-get install -y kubelet kubeadm
                  apt-mark hold kubelet kubeadm

                  # install Docker runtime
                  sudo apt-get update
                  sudo apt-get install -y \
                  apt-transport-https \
                  ca-certificates \
                  curl \
                  gnupg-agent \
                  software-properties-common

                  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                  sudo add-apt-repository \
                  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                  $(lsb_release -cs) \
                  stable"

                  sudo apt-get update

                  sudo apt-get install docker-ce docker-ce-cli containerd.io -y
                  EOF
  tags = {
    created_by = "wadghulegaurav@gmail.com"
  }
}


resource "aws_instance" "worker1-k8" {
  ami           = "ami-013f17f36f8b1fefb"
  instance_type = "t2.micro"
  availability_zone = "us-east-1b"
  key_name = "coda-k8-ec2"
  security_groups = [aws_security_group.k8_sg.name]
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo -i
                  apt-get update
                  swapoff -a
                  apt-get update && apt-get install -y apt-transport-https curl
                  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
                  cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
                  deb https://apt.kubernetes.io/ kubernetes-xenial main
                  EOF
                  apt-get update
                  apt-get install -y kubelet kubeadm
                  apt-mark hold kubelet kubeadm

                  # install Docker runtime
                  sudo apt-get update
                  sudo apt-get install -y \
                  apt-transport-https \
                  ca-certificates \
                  curl \
                  gnupg-agent \
                  software-properties-common

                  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
                  sudo add-apt-repository \
                  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
                  $(lsb_release -cs) \
                  stable"

                  sudo apt-get update

                  sudo apt-get install docker-ce docker-ce-cli containerd.io -y
                  EOF
  tags = {
    created_by = "wadghulegaurav@gmail.com"
  }
}
