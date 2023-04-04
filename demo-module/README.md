
# Module `demo-module`

Provider Requirements:
* **alicloud:** (any version)

## Input Variables
* `image_id` (default `"ubuntu_18_04_64_20G_alibase_20200914.vhd"`): The ID of the image used to launch the ECS instance
* `instance_type` (default `"ecs.t5-lc1m2.small"`): The instance type of the ECS instance
* `internet_charge_type` (default `"PayByTraffic"`): The billing method of the public network bandwidth
* `internet_max_bandwidth_out` (default `5`): The maximum outbound bandwidth of the public network
* `jar_url` (required): The URL of the Jar package to be deployed
* `security_group_id` (required): The ID of the security group to be associated with the ECS instance
* `vswitch_id` (required): The ID of the VSwitch to be associated with the ECS instance

## Output Values
* `public_ip`

## Managed Resources
* `alicloud_instance.example` from `alicloud`

