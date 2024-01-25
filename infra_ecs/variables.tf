variable "aws_region" {
  default = "us-east-1"

}

variable "cluster_name" {
  default = "tech-challenge-cluster"

}

variable "aws_cloudwatch_log_group" {
  default = "/ecs/tech-challenge"
}

variable "mongodb_cluster" {
  default = "mongodb-tech-challenge-cluster"
}