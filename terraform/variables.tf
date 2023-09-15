# Global Tags 
variable "environment" {
  type        = string
  description = "Global environment tag"
}

variable "name" {
  type        = string
  description = "Global name tag"
}

variable "application" {
  type        = string
  description = "Global Application Name"
}

# VPC CIDR Blocks 

variable "vpc_main_cidr" {
  type = string
}
variable "public_cidr_1" {
  type = string
}
variable "public_cidr_2" {
  type = string
}
variable "private_cidr_1" {
  type = string
}
variable "private_cidr_2" {
  type = string
}
variable "private_rds_cidr_1" {
  type = string
}
variable "private_rds_cidr_2" {
  type = string
}

variable "aws_region" {
  type        = string
  description = "AWS Region"

}

variable "aws_profile" {
  type        = string
  description = "Profile for AWS Target Account "
}

variable "db_create" {
  type        = bool
  description = "1 to create DB 0 don't Create DB"
}
variable "dns_name" {
  type        = string
  description = "Domain Name"

}

variable "db_port" {
  type        = string
  description = "Database Port"
}

variable "db_storage" {
  type        = number
  description = "Database Storage Size in GB"

}

variable "db_engine" {
  type        = string
  description = "Database Engine Type"
}

variable "db_engine_version" {
  type        = string
  description = "Database Engine Version"
}

variable "db_instance_class" {
  type        = string
  description = "Database Instance Class"
}

variable "db_parameter_group_name" {
  type        = string
  description = "Database Parameter Group Name"
}

variable "db_master_username" {
  type        = string
  description = "Database Master User Name"
}

variable "db_master_password" {
  type        = string
  description = "Database Master Password"
}

variable "database_schema" {
  type        = string
  description = "Database Schema Existing"
}



variable "alb_certificate_arn" {
  type        = string
  description = "ALB Certificate ARN"

}

# Specific Configuration Repository for telleroo_application



variable "telleroo_application_ecr_name" {
  type        = string
  description = "ECR Name"
}

variable "telleroo_application_image_name" {
  type        = string
  description = "Front End Image Name"
}

variable "telleroo_application_ecs_container_name" {
  type        = string
  description = "ECS container name"

}

variable "telleroo_application_ecs_container_port" {
  type        = number
  description = "ECS Container Port"
}

variable "telleroo_application_ecs_backend_container_port" {
  type        = number
  description = "ECS Backend Container Port"
}

variable "telleroo_application_image_version" {
  type        = string
  description = "Code Pipeline Image Version"
}

variable "telleroo_application_pipeline_FullRepositoryID" {
  type        = string
  description = "Code Pipeline Full Repository ID"
}

variable "telleroo_application_pipeline_BranchName" {
  type        = string
  description = "Code Pipeline Branch Name"
}

# Pipeline Specific Configuration Repository telleroo_liveaction


variable "telleroo_liveaction_ecr_name" {
  type        = string
  description = "ECR Name"
}


variable "telleroo_liveaction_image_name" {
  type        = string
  description = "Front End Image Name"
}

variable "telleroo_liveaction_ecs_container_name" {
  type        = string
  description = "ECS container name"

}

variable "telleroo_liveaction_ecs_container_port" {
  type        = number
  description = "ECS Container Port"
}

variable "telleroo_liveaction_ecs_backend_container_port" {
  type        = number
  description = "ECS Backend Container Port"
}


variable "telleroo_liveaction_image_version" {
  type        = string
  description = "Code Pipeline Image Version"
}

variable "telleroo_liveaction_pipeline_FullRepositoryID" {
  type        = string
  description = "Code Pipeline Full Repository ID"
}

variable "telleroo_liveaction_pipeline_BranchName" {
  type        = string
  description = "Code Pipeline Branch Name"
}

# Filler 
variable "filler" {
  type = string
  description = "It deduplicates staging and productino resources"
  default = ""
}
# Bastion Security Group ( Hard Coded )

variable "bastion_security_group" {
  type        = string
  description = "Bastion Security Group ID"
}
