output "s3_bucket_name" {
  value = aws_s3_bucket.trail_logs.id
}

output "cloudtrail_arn" {
  value = aws_cloudtrail.trail.arn
}

output "sns_topic_arn" {
  value = aws_sns_topic.alerts.arn
}
