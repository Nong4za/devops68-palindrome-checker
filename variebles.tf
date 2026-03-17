variable "gcp_project" {
  description = "ID ของ Project ใน Google Cloud"
  type        = string
}

variable "gcp_region" {
  description = "Region ที่ต้องการสร้างระบบ"
  default     = "asia-southeast1" # สิงคโปร์
  type        = string
}