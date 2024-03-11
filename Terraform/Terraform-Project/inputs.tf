variable "vpc_cidr" {
  type        = string
  description = "This is the cidr value of vpc"
}

variable "subnet_names" {
  type        = list(string)
  description = "These are subnet names"
}

variable "subnet_azs" {
  type        = list(string)
  description = "These are subnet availability zones"
}

variable "ec2_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "These are ec2 security group rules"
}

variable "alb_sg_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type       = string
      from_port  = number
      to_port    = number
      protocol   = string
      cidr_block = string
    }))
  })
  description = "These are alb security group rules"
}

variable "ec2_ami" {
  type        = string
  description = "This is the instance ami"
}

variable "ec2_instance_type" {
  type        = string
  description = "Instance type of ec2 instance"
}

variable "lb_type" {
  type        = string
  description = "This is the type of load balancer"
}

variable "lb_tg_port" {
  type        = number
  description = "This is the lb target group port"
}

variable "lb_tg_protocol" {
  type        = string
  description = "This is lb target group protocol"
}