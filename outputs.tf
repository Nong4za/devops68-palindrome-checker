output "website_url" {
  description = "Copy URL นี้ไปเปิดใน Browser"
  value       = "http://${google_compute_instance.nodejs_server.network_interface[0].access_config[0].nat_ip}:3007"
}