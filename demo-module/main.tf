variable "jar_url" {
  description = "The URL of the Jar file to be deployed"
}

variable "instance_type" {
  description = "The instance type of the ECS instance"
  default     = "ecs.t5-lc1m2.small"
}

variable "image_id" {
  description = "The ID of the image used to launch the ECS instance"
  default     = "ubuntu_18_04_64_20G_alibase_20200722.vhd"
}

variable "system_disk_category" {
  description = "The category of the system disk"
  default     = "cloud_efficiency"
}

variable "system_disk_size" {
  description = "The size of the system disk"
  default     = 40
}

variable "security_group_id" {
  description = "The ID of the security group to be associated with the ECS instance"
}

variable "vswitch_id" {
  description = "The ID of the VSwitch to be associated with the ECS instance"
}

variable "region" {
  description = "The region where the ECS instance will be launched"
  default     = "cn-hangzhou"
}

provider "alicloud" {
  region = var.region
}

resource "alicloud_instance" "ecs_instance" {
  instance_name         = "ecs-instance"
  instance_type         = var.instance_type
  image_id              = var.image_id
  system_disk_category  = var.system_disk_category
  system_disk_size      = var.system_disk_size
  internet_charge_type  = "PayByTraffic"
  internet_max_bandwidth_out = 5
  vswitch_id            = var.vswitch_id
  security_groups       = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              wget ${var.jar_url}
              java -jar <jar_file_name>
              EOF
}

output "public_ip_address" {
  value = alicloud_instance.ecs_instance.public_ip_address
}