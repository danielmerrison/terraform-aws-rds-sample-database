output "address" {
  value       = aws_db_instance.this.address
  description = "Database hostname"
}

output "username" {
  value       = aws_db_instance.this.username
  description = "Database username"
}

output "password" {
  value       = aws_db_instance.this.password
  sensitive   = true
  description = "Database password"
}
