resource "aws_instance" "orchestrate" {
  ami                         = data.aws_ami.ubuntu_2004.id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  #user_data                   = filebase64("cloud-init/node.yml")
  user_data              = templatefile("cloudinit/orchestrate.yml", { ssh_pub_key = var.ssh_pub_key, remote_user = var.user_name })
  subnet_id              = aws_subnet.sub_pub_1.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
}

resource "aws_instance" "zk_1" {
  ami                         = data.aws_ami.ubuntu_2004.id
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  #user_data                   = filebase64("cloud-init/node.yml")
  user_data              = templatefile("cloudinit/zk.yml", { ssh_pub_key = var.ssh_pub_key, remote_user = var.user_name })
  subnet_id              = aws_subnet.sub_pub_1.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.zk_sg.id]
}

resource "aws_instance" "zk_2" {
  ami                         = data.aws_ami.ubuntu_2004.id
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  #user_data                   = filebase64("cloud-init/node.yml")
  user_data              = templatefile("cloudinit/zk.yml", { ssh_pub_key = var.ssh_pub_key, remote_user = var.user_name })
  subnet_id              = aws_subnet.sub_pub_2.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.zk_sg.id]
}

resource "aws_instance" "zk_3" {
  ami                         = data.aws_ami.ubuntu_2004.id
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  #user_data                   = filebase64("cloud-init/node.yml")
  user_data              = templatefile("cloudinit/zk.yml", { ssh_pub_key = var.ssh_pub_key, remote_user = var.user_name })
  subnet_id              = aws_subnet.sub_pub_3.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.zk_sg.id]
}

# resource "aws_instance" "zk_4" {

# }

# resource "aws_instance" "zk_5" {

# }

# resource "aws_instance" "zk_6" {

# }

resource "aws_instance" "kafka_1" {
  ami                         = data.aws_ami.ubuntu_2004.id
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  user_data              = templatefile("cloudinit/kafka.yml", { ssh_pub_key = var.ssh_pub_key, remote_user = var.user_name })
  subnet_id              = aws_subnet.sub_pub_3.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.kafka_sg.id]
}

resource "aws_instance" "kafka_2" {
  ami                         = data.aws_ami.ubuntu_2004.id
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  user_data              = templatefile("cloudinit/kafka.yml", { ssh_pub_key = var.ssh_pub_key, remote_user = var.user_name })
  subnet_id              = aws_subnet.sub_pub_3.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.kafka_sg.id]
}

resource "aws_instance" "kafka_3" {
  ami                         = data.aws_ami.ubuntu_2004.id
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  user_data              = templatefile("cloudinit/kafka.yml", { ssh_pub_key = var.ssh_pub_key, remote_user = var.user_name })
  subnet_id              = aws_subnet.sub_pub_3.id
  vpc_security_group_ids = [aws_security_group.ssh_sg.id, aws_security_group.kafka_sg.id]
}