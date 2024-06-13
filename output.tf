output "ssh-command" {
  value = "ssh -i ${local_file.key.filename} ec2-user@${aws_instance.lamp-server.public_ip}"
}

output "pip" {
  value = aws_instance.lamp-server.public_ip
}