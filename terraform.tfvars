#Load Balancer
#subnets = ["subnet-a0c7eccb","subnet-72c4a50f"]
subnet_1 = "subnet-a0c7eccb"
subnet_2 = "subnet-72c4a50f"

#Security Group
office_ip = "***.***.***.***"

#Route 53
dns_zone_id = "Z2SES4QQYEBZL9"
dns_zone_name = "test.***.ua"

#launch_configuration
image_id = "ami-02ea8f348fa28c108"
instance_type = "t2.micro"
key_name = "***"

#root_block_device
volume_type = "gp2"
volume_size =  "8"