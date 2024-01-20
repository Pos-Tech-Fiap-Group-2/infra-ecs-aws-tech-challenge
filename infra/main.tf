resource "aws_kms_key" "tech-challenge-kms-key" {
  description             = "KMS Key for Tech-Challenge"
  deletion_window_in_days = 7
  is_enabled              = true
  enable_key_rotation     = true

}

resource "aws_cloudwatch_log_group" "tech-challenge-log-group" {
  name              = var.aws_cloudwatch_log_group
  retention_in_days = 7

}

resource "aws_ecs_cluster" "tech-challenge-cluster" {
  name = var.cluster_name

  configuration {
    execute_command_configuration {
      kms_key_id = aws_kms_key.tech-challenge-kms-key.arn
      logging    = "OVERRIDE"

      log_configuration {
        cloud_watch_encryption_enabled = true
        cloud_watch_log_group_name     = aws_cloudwatch_log_group.tech-challenge-log-group.name
      }
    }
  }
}
