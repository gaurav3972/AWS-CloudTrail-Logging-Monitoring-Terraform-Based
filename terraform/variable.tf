variable "region" {
  default = "ap-south-1"
}

variable "trail_name" {
  default = "secure-cloudtrail"
}

variable "bucket_name" {
  default = "secure-cloudtrail-logs"
}

variable "alert_email" {
  default = "your.email@example.com"
}
