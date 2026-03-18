variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "name_prefix" {
  type    = string
  default = "northstar-demo"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "foundation_state_bucket" {
  type = string
}

variable "foundation_state_key" {
  type    = string
  default = "foundation/dev/terraform.tfstate"
}

variable "foundation_lock_table" {
  type = string
}

variable "container_port" {
  type    = number
  default = 80
}

variable "container_image" {
  type    = string
  default = "public.ecr.aws/docker/library/nginx:stable-alpine"
}

variable "image_tag" {
  type    = string
  default = "latest"
}

variable "cpu" {
  type    = number
  default = 256
}

variable "memory" {
  type    = number
  default = 512
}

variable "desired_count" {
  type    = number
  default = 1
}

variable "tags" {
  type = map(string)
  default = {
    Application = "flight-management"
    Environment = "dev"
    Project     = "northstar-demo"
  }
}
