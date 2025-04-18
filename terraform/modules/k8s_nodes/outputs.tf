
output "master_private_ip" {
  value = aws_instance.master.private_ip
}

output "worker_private_ips" {
  value = [for instance in aws_instance.workers : instance.private_ip]
}
