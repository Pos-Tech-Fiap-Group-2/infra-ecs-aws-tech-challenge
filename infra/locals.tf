locals {
  subnet_ids = { for k, v in aws_subnet.tech-challenge-subnet : v.tags.Name => v.id }

  common_tags = {
    "Project" = "ECS Tech-Challenge"
    CreatedAt = timestamp()
    ManagedBy = "Terraform"
    Owner     = "ECS Tech-Challenge"
    Service   = "ECS Fargate Tech-Challenge"
  }
}
