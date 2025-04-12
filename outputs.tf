output "public_ip" {
  value       = aws_instance.splunk_server.public_ip
}

output "splunk_credentials" {
  description = "Splunk Web Login Credentials"
  value = <<EOT
username: admin
password: SPLUNK-${aws_instance.splunk_server.id}
EOT
}
