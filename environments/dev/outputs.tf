output "service_name" {
  value = module.app_service.service_name
}

output "ecr_repository_url" {
  value = module.app_service.ecr_repository_url
}

output "target_group_arn" {
  value = module.app_service.target_group_arn
}
