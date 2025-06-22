<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> cf74326 (add)
# AWS-CloudTrail-Logging-Monitoring-Terraform-Based-
=======
# 📘 AWS CloudTrail Logging & Monitoring (Terraform-Based)

## ✅ Project Purpose

This project provisions a **secure, multi-region AWS CloudTrail setup** using Terraform. It:

- Logs all API activity to an encrypted S3 bucket
- Sends logs to CloudWatch Logs
- Monitors critical actions (e.g., root login, `StopLogging`, `DeleteTrail`) via CloudWatch alarms
- Sends alert notifications using SNS

---

## 🧱 Infrastructure Components

- **CloudTrail**: Captures AWS API activity across regions
- **S3 Bucket**: Stores logs securely (AES256 encryption & versioning)
- **CloudWatch Log Group**: Receives trail events
- **Metric Filters**: Detect risky events (e.g. root login)
- **CloudWatch Alarms**: Triggered based on metric thresholds
- **SNS Topic**: Sends alert emails

---

## 🚀 Deployment Steps

### 1️⃣ Prepare the Environment

- Ensure Terraform and AWS CLI are installed
- Configure the AWS CLI:

```bash
aws configure
```

> Provide your Access Key, Secret Key, Region (e.g. `ap-south-1`), and output format (e.g. `json`)

---

### 2️⃣ Set Up the Project Structure

Create the following directory layout:

```
cloudtrail-logging/
└── terraform/
    ├── main.tf
    ├── cloudwatch.tf
    ├── sns.tf
    ├── variables.tf
    ├── outputs.tf
    └── backend.tf (optional)
```

---

### 3️⃣ Edit `variables.tf`

Set values for CloudTrail name, S3 bucket name, and your email for alerts:

```hcl
variable "trail_name" {
  default = "secure-cloudtrail"
}

variable "bucket_name" {
  default = "secure-cloudtrail-logs"
}

variable "alert_email" {
  default = "your.email@example.com"
}
```

---

### 4️⃣ Initialize Terraform

Run inside the `terraform/` directory:

```bash
terraform init
```

---

### 5️⃣ Preview the Deployment (Optional)

Check planned infrastructure changes:

```bash
terraform plan
```

---

### 6️⃣ Deploy Infrastructure

Launch the full stack:

```bash
terraform apply
```

> Type `yes` when prompted.

---

### 7️⃣ Confirm SNS Subscription

- Check the inbox of the `alert_email` you configured
- Click **Confirm subscription** in the AWS SNS email

---

### 8️⃣ Test Critical Actions (Optional)

Trigger or simulate any of the following for testing:

- Console login as root
- Attempt to delete the trail
- Disable CloudTrail logging

Then monitor:

- **S3 Bucket**: for raw logs
- **CloudWatch Logs**: for real-time inspection
- **CloudWatch Alarms**: for alerts
- **Email**: for SNS notifications

---

## 📌 Notes

- You can make the trail organizational by setting `is_organization_trail = true` (IAM permissions required)
- All resources are managed via Terraform—repeatable, auditable, and scalable
- Alarm and filter types can be extended based on your organization's security posture

---

Want to add automated log retention, KMS encryption for even tighter control, or org-wide support? I'm happy to help you scale this next.
>>>>>>> dbbc23e (add)
<<<<<<< HEAD
=======
# AWS-CloudTrail-Logging-Monitoring-Terraform-Based
=======
# AWS-CloudTrail-Logging-Monitoring-Terraform-Based-
>>>>>>> 5171ec2 (Initial commit)
>>>>>>> 836fa09 (add)
=======
>>>>>>> cf74326 (add)
