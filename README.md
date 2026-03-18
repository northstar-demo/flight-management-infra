# flight-management-infra

Terraform root for the flight-management application.

## What this repo creates

- one ECR repository
- one ECS Fargate service
- one target group
- one ALB listener rule for `/flight/*`
- one CloudWatch log group

Replace the placeholder module source in [`environments/dev/main.tf`](/Users/harish/Documents/Playground/flight-management-infra/environments/dev/main.tf) with your GitHub org and release tag.
