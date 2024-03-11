# create an instance in the subnet of az-1a
resource "aws_instance" "ec2-1" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  availability_zone      = var.subnet_azs[0]
  subnet_id              = aws_subnet.subnets[0].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data              = base64encode(file("userdata1.sh"))
  tags = {
    Name = "Server-1"
  }
}

# create an instance in the subnet of az-1b
resource "aws_instance" "ec2-2" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  availability_zone      = var.subnet_azs[1]
  subnet_id              = aws_subnet.subnets[1].id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  user_data              = base64encode(file("userdata2.sh"))
  tags = {
    Name = "Server-2"
  }
}

