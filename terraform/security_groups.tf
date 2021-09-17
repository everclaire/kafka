## Allow SSH
resource "aws_security_group" "ssh_sg" {
  name        = join("", [var.user_name, "-", "ssh", "-", "kafka-sg"])
  description = "Allow SSH connections"
  vpc_id      = aws_vpc.kafka.id
  ingress {
    description = "Allow SSH connections"
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "zk_sg" {
  name        = join("", [var.user_name, "-", "zk", "-", "communication"])
  description = "Allow Zookeeper client and server communication"
  vpc_id      = aws_vpc.kafka.id
  ingress {
    description     = "ZK client connections"
    from_port       = 2181
    to_port         = 2181
    protocol        = "TCP"
    cidr_blocks = [ aws_subnet.sub_priv_1.cidr_block,
                    aws_subnet.sub_priv_2.cidr_block, 
                    aws_subnet.sub_priv_3.cidr_block ]
  }
  ingress {
    description     = "ZK peer port"
    from_port       = 2888
    to_port         = 2888
    protocol        = "TCP"
    cidr_blocks = [ aws_subnet.sub_priv_1.cidr_block,
                    aws_subnet.sub_priv_2.cidr_block, 
                    aws_subnet.sub_priv_3.cidr_block ]
  }
  ingress {
    description     = "ZK peer port"
    from_port       = 3888
    to_port         = 3888
    protocol        = "TCP"
    cidr_blocks = [ aws_subnet.sub_priv_1.cidr_block,
                    aws_subnet.sub_priv_2.cidr_block, 
                    aws_subnet.sub_priv_3.cidr_block ]
  }
  ingress {
    description = "ZK web port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}