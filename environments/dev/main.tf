data "terraform_remote_state" "foundation" {
  backend = "s3"

  config = {
    bucket         = var.foundation_state_bucket
    key            = var.foundation_state_key
    region         = var.region
    dynamodb_table = var.foundation_lock_table
  }
}

locals {
  app_listener_arn = try(
    data.terraform_remote_state.foundation.outputs.https_listener_arn,
    null
  ) != null ? data.terraform_remote_state.foundation.outputs.https_listener_arn : data.terraform_remote_state.foundation.outputs.http_listener_arn
}

module "app_service" {
  source = "git::https://github.com/northstar-demo/shared-terraform-modules.git//modules/app-service?ref=v0.1.0"

  name_prefix            = var.name_prefix
  app_name               = "flight-management"
  cluster_name           = data.terraform_remote_state.foundation.outputs.cluster_name
  vpc_id                 = data.terraform_remote_state.foundation.outputs.vpc_id
  subnet_ids             = data.terraform_remote_state.foundation.outputs.public_subnet_ids
  task_security_group_id = data.terraform_remote_state.foundation.outputs.ecs_tasks_security_group_id
  listener_arn           = local.app_listener_arn
  path_patterns          = ["/flight/*"]
  listener_rule_priority = 110
  container_port         = var.container_port
  container_image        = var.container_image
  image_tag              = var.image_tag
  cpu                    = var.cpu
  memory                 = var.memory
  desired_count          = var.desired_count
  environment_variables = {
    APP_NAME    = "flight-management"
    APP_PATH    = "/flight/"
    ENVIRONMENT = var.environment
  }
  tags = var.tags
}
