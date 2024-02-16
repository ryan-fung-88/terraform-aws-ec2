variable "ami" {
  description = "ID of AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
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