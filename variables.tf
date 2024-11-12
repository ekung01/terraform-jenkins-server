
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-west-2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.large"

  validation {
    condition     = can(regex("^t2\\.|^t3\\.", var.instance_type))
    error_message = "Instance type must be t2 or t3 series."
  }
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "allowed_cidr" {
  description = "CIDR block allowed to access Jenkins"
  type        = string
  default     = "" # Replace with your IP

  validation {
    condition     = can(cidrhost(var.allowed_cidr, 0))
    error_message = "Must be a valid CIDR block."
  }
}

variable "state_bucket_name" {
  description = "Name of the S3 bucket for terraform state"
  type        = string
  default     = "jenkins-terraform-state-backend"
}

variable "dynamodb_table_name" {
  description = "Name of the DynamoDB table for terraform state locking"
  type        = string
  default     = "jenkins-terraform-state-lock"
}
