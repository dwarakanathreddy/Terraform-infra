output "instance_public_ip" {
description = "aws public"
value = aws_instance.web[*].public_ip
  
}


output "instance_public_ip_map" {
description = "public ip map"
value = {for instance in aws_instance.web: instance.id=>instance.public_ip}
}

output "instance_count_map" {
description = "public ip map count"
value = {for c, instance in aws_instance.web: c=>instance.public_dns}
  
}