variable "jar_url" {
  description = "The URL of the Jar package to be deployed"
}

variable "instance_type" {
  description = "The instance type of the ECS instance"
  default     = "ecs.t5-lc1m2.small"
}

variable "image_id" {
  description = "The ID of the image used to launch the ECS instance"
  default     = "ubuntu_18_04_64_20G_alibase_20200914.vhd"
}

variable "security_group_id" {
  description = "The ID of the security group to be associated with the ECS instance"
}

variable "vswitch_id" {
  description = "The ID of the VSwitch to be associated with the ECS instance"
}

variable "internet_charge_type" {
  description = "The billing method of the public network bandwidth"
  default     = "PayByTraffic"
}

variable "internet_max_bandwidth_out" {
  description = "The maximum outbound bandwidth of the public network"
  default     = 5
}

provider "alicloud" {
  access_key = var.access_key
  secret_key = var.secret_key
  region     = var.region
}

resource "alicloud_instance" "example" {
  instance_name         = "example-instance"
  instance_type         = var.instance_type
  image_id              = var.image_id
  security_group_id     = var.security_group_id
  vswitch_id            = var.vswitch_id
  internet_charge_type  = var.internet_charge_type
  internet_max_bandwidth_out = var.internet_max_bandwidth_out

  user_data = <<-EOF
              #!/bin/bash
              wget ${var.jar_url}
              java -jar example.jar
              EOF
}

output "public_ip" {
  value = alicloud_instance.example.public_ip
}