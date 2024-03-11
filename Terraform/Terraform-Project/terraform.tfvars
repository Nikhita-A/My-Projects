vpc_cidr     = "10.0.0.0/16"
subnet_names = ["subnet1", "subnet2"]
subnet_azs   = ["us-west-1a", "us-west-1b"]
ec2_sg_config = {
  name        = "ec2 sg rules"
  description = "allows incoming http port 80, ssh port 22 and all outgoing traffic"
  rules = [{
    type       = "ingress"
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    },
    {
      type       = "ingress"
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}
alb_sg_config = {
  name        = "alb sg rules"
  description = "allows incoming http port 80 and all outgoing traffic"
  rules = [{
    type       = "ingress"
    from_port  = 80
    to_port    = 80
    protocol   = "tcp"
    cidr_block = "0.0.0.0/0"
    },
    {
      type       = "ingress"
      from_port  = 22
      to_port    = 22
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0"
    },
    {
      type       = "egress"
      from_port  = 0
      to_port    = 65535
      protocol   = "-1"
      cidr_block = "0.0.0.0/0"
    }
  ]
}
ec2_ami           = "ami-0a0409af1cb831414"
ec2_instance_type = "t2.micro"
lb_type           = "application"
lb_tg_port        = 80
lb_tg_protocol    = "HTTP"