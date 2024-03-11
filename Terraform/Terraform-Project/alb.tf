# create an application load balancer
resource "aws_lb" "terraform_project_alb" {
  name               = "terraform-project-alb"
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [aws_subnet.subnets[0].id, aws_subnet.subnets[1].id]
  tags = {
    name = "terraform-project-alb"
  }
}

# create target group for alb
resource "aws_lb_target_group" "terraform_project_tg" {
  name     = "terraform-project-tg"
  port     = var.lb_tg_port
  protocol = var.lb_tg_protocol
  vpc_id   = aws_vpc.my_terraform_project_vpc.id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

# attach instance-1 to the target group
resource "aws_lb_target_group_attachment" "tg_attach1" {
  target_group_arn = aws_lb_target_group.terraform_project_tg.id
  target_id        = aws_instance.ec2-1.id
  port             = 80
}

# attach instance-2 to the target group
resource "aws_lb_target_group_attachment" "tg_attach2" {
  target_group_arn = aws_lb_target_group.terraform_project_tg.id
  target_id        = aws_instance.ec2-2.id
  port             = 80
}

# configure listener for alb
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.terraform_project_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.terraform_project_tg.arn
  }
}