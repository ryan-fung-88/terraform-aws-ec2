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
  count             = var.attach_volume ? 1 : 0
  availability_zone = aws_instance.this.availability_zone
  encrypted         = true
  size              = var.ebs_size
  type              = "gp3"
}

resource "aws_volume_attachment" "this" {
  count       = var.attach_volume ? 1 : 0
  device_name = var.ebs_device_name
  volume_id   = aws_ebs_volume.this[count.index].id
  instance_id = aws_instance.this.id
} 