provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = "us-east-1a"
  subnet_id              = "subnet-123"
  vpc_security_group_ids = "security-group-123"

  root_block_device {
    delete_on_termination = true
    encrypted             = true
    volume_size           = 100
    volume_type           = "gp3"
  }

  associate_public_ip_address = false
  disable_api_termination     = true
}

resource "aws_ebs_volume" "this" {
  for_each  = var.ebs_block_device
  availability_zone = aws_instance.this.availability_zone
  encrypted = true
  size = each.value.size
  type = "gp3"
}

resource "aws_volume_attachment" "this" {
  for_each = aws_ebs_volume.this
  device_name = var.ebs_device_name
  volume_id = aws_ebs_volume.this.id
  instance_id = aws_instance.this.id
} 