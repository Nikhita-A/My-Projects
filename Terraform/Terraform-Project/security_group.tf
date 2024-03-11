# create security group for ec2 instances
resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  description = "allows incoming http port 80, ssh port 22 and all outgoing traffic"
  vpc_id      = aws_vpc.my_terraform_project_vpc.id
  depends_on  = [aws_vpc.my_terraform_project_vpc]
}

# security group rules for ec2 instances
resource "aws_security_group_rule" "ec2_sg_rules" {
  count             = length(var.ec2_sg_config.rules)
  type              = var.ec2_sg_config.rules[count.index].type
  from_port         = var.ec2_sg_config.rules[count.index].from_port
  to_port           = var.ec2_sg_config.rules[count.index].to_port
  protocol          = var.ec2_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.ec2_sg_config.rules[count.index].cidr_block]
  security_group_id = aws_security_group.ec2_sg.id
  depends_on        = [aws_security_group.ec2_sg]
}

# create security group for alb (application load balancer)
resource "aws_security_group" "alb_sg" {
  name        = "alb_sg"
  description = "allows incoming http port 80 and all outgoing traffic"
  vpc_id      = aws_vpc.my_terraform_project_vpc.id
  depends_on  = [aws_vpc.my_terraform_project_vpc]
}

# security group rules for alb
resource "aws_security_group_rule" "alb_sg_rules" {
  count             = length(var.alb_sg_config.rules)
  type              = var.alb_sg_config.rules[count.index].type
  from_port         = var.ec2_sg_config.rules[count.index].from_port
  to_port           = var.ec2_sg_config.rules[count.index].to_port
  protocol          = var.ec2_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.ec2_sg_config.rules[count.index].cidr_block]
  security_group_id = aws_security_group.alb_sg.id
  depends_on        = [aws_vpc.my_terraform_project_vpc]
}
