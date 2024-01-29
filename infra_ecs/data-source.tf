data "aws_security_group" "tech-challenge-alb-sg" {
  id = var.security_group_id
}

data "aws_vpc" "tech-challenge-vpc" {
  id = var.vpc_id
}

data "aws_subnets" "tech-challenge-subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.tech-challenge-vpc.id]
  }
  
}

data "aws_subnet" "selected-subnet" {
 id = tolist(data.aws_subnets.tech-challenge-subnet.ids)[0]
}