output "instance_name" {
  description = "Name of the SQL instance"
  value       = google_sql_database_instance.this.name
}

output "connection_name" {
  description = "Connection name in format project:region:name"
  value       = google_sql_database_instance.this.connection_name
}

output "self_link" {
  description = "Self-link of the instance"
  value       = google_sql_database_instance.this.self_link
}
