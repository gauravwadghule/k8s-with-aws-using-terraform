resource "aws_security_group" "k8_sg" {
  name        = "k8_sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.k8_vpc.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.k8_vpc.cidr_block]
  }

    ingress {
    description = "KubeAPI port from VPC"
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.k8_vpc.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}