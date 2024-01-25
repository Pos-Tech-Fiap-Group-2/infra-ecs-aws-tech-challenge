locals {
 
  common_tags = {
    "Project" = "ECS Tech-Challenge"
    CreatedAt = timestamp()
    ManagedBy = "Terraform"
    Owner     = "ECS Tech-Challenge"
    Service   = "ECS Fargate Tech-Challenge"
  }
}
