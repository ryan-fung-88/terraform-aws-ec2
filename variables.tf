variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string

  validation {
    condition = contains([
      "t3.nano",
      "t3.micro",
      "t3.small",
      "t3.medium",
      "t3.large",
      "t3.xlarge",
      "t3.2xlarge",
      "m5.large",
      "m5.xlarge",
      "m5.2xlarge",
      "m5.4xlarge",
      "m5.8xlarge",
      "m5.12xlarge",
      "m5.16xlarge",
      "m5.24xlarge",
      "m5.metal",
      "r5.large",
      "r5.xlarge",
      "r5.2xlarge",
      "r5.4xlarge",
      "r5.8xlarge",
      "r5.12xlarge",
      "r5.16xlarge",
      "r5.24xlarge",
      "r5.metal",
    ], var.instance_type)
    error_message = "Please refernce to the Instance Type and Size document"
  }
}

variable "ebs_device_name" {
  description = "Name of the EBS Volume Device"
  type        = string
}

variable "ebs_size" {
  description = "Size of EBS Volume in GiBs"
  type        = number
}

variable "attach_volume" {
  description = "Bool value if an EBS volume is to be attached to ec2 instance"
  type        = bool
}