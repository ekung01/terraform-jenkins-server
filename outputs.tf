output "jenkins_public_ip" {
  value       = aws_instance.jenkins_server.public_ip
  description = "Public IP of Jenkins server"
  sensitive   = false
}

output "jenkins_instance_id" {
  value       = aws_instance.jenkins_server.id
  description = "Instance ID of Jenkins server"
  sensitive   = false
}

output "jenkins_url" {
  value       = "http://${aws_instance.jenkins_server.public_ip}:8080"
  description = "URL to access Jenkins"
  sensitive   = false
}

output "vpc_id" {
  value       = data.aws_vpc.default.id
  description = "ID of the default VPC"
  sensitive   = false
}

output "subnet_id" {
  value       = tolist(data.aws_subnets.default.ids)[0]
  description = "ID of the subnet used"
  sensitive   = false
}
