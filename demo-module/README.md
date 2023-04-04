
# Module `demo-module`

Provider Requirements:
* **alicloud:** (any version)

## Input Variables
* `image_id` (default `"ubuntu_18_04_64_20G_alibase_20200722.vhd"`): The ID of the image used to launch the ECS instance
* `instance_type` (default `"ecs.t5-lc1m2.small"`): The instance type of the ECS instance
* `jar_url` (required): The URL of the Jar file to be deployed
* `region` (default `"cn-hangzhou"`): The region where the ECS instance will be launched
* `security_group_id` (required): The ID of the security group to be associated with the ECS instance
* `system_disk_category` (default `"cloud_efficiency"`): The category of the system disk
* `system_disk_size` (default `40`): The size of the system disk
* `vswitch_id` (required): The ID of the VSwitch to be associated with the ECS instance

## Output Values
* `public_ip_address`

## Managed Resources
* `alicloud_instance.ecs_instance` from `alicloud`

