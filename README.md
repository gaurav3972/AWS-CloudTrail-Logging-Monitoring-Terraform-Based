Sure! Below is your **full documentation** with **numbered deployment steps** — perfect for a `README.md`, internal wiki, or handoff doc. It includes purpose, infrastructure components, setup instructions, and clean-up steps.

---

# 📘 AWS CloudTrail Logging & Monitoring (Terraform-Based)

## ✅ Project Purpose

This project provisions a **secure, multi-region AWS CloudTrail setup** using Terraform. It:

* Logs all AWS API activity to an encrypted S3 bucket
* Streams logs to CloudWatch Logs
* Detects high-risk actions (e.g., root login, `StopLogging`, `DeleteTrail`)
* Triggers CloudWatch alarms
* Sends alerts via Amazon SNS

---

## 🧱 Infrastructure Components

| Component             | Purpose                                                |
| --------------------- | ------------------------------------------------------ |
| **CloudTrail**        | Captures API calls across AWS                          |
| **S3 Bucket**         | Stores logs with AES256 encryption and versioning      |
| **CloudWatch Logs**   | Receives logs for real-time inspection                 |
| **Metric Filters**    | Detect critical events (e.g., root login)              |
| **CloudWatch Alarms** | Alert on detection of risky activities                 |
| **SNS Topic**         | Sends alert notifications via email                    |
| **IAM Role/Policy**   | Allows CloudTrail to deliver logs to CloudWatch and S3 |

---

## 🔧 Prerequisites

* AWS Account with permissions to create CloudTrail, CloudWatch, S3, and SNS resources
* [Terraform v1.3+](https://www.terraform.io/downloads)
* [AWS CLI v2+](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
* Valid email address for receiving SNS notifications

---

## 📁 Project Structure

```
cloudtrail-logging/
└── terraform/
    ├── main.tf             # Core CloudTrail and S3 setup
    ├── cloudwatch.tf       # Metric filters and alarms
    ├── sns.tf              # SNS topic and subscription
    ├── variables.tf        # Input variables
    ├── outputs.tf          # Outputs like bucket name, topic ARN
    └── backend.tf          # Optional: Remote state config
```

---

## 🚀 Deployment Steps

### 1️⃣ Install Required Tools

Ensure you have:

* [Terraform](https://www.terraform.io/downloads)
* [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)

---

### 2️⃣ Configure AWS Credentials

Run the following command:

```bash
aws configure
```

Enter your:

* AWS Access Key ID
* AWS Secret Access Key
* Default region (e.g. `ap-south-1`)
* Default output format (`json`, `table`, etc.)

---

### 3️⃣ Set Up Directory and Files

Create the directory structure:

```
cloudtrail-logging/
└── terraform/
```

Then place these Terraform files inside:

* `main.tf`
* `cloudwatch.tf`
* `sns.tf`
* `variables.tf`
* `outputs.tf`
* (Optional) `backend.tf`

---

### 4️⃣ Configure Input Variables

In `variables.tf`, define:

```hcl
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
```

Replace `your.email@example.com` with your real email.

---

### 5️⃣ Initialize Terraform

Navigate to the Terraform directory:

```bash
cd terraform/
terraform init
```

---

### 6️⃣ Preview Terraform Plan (Optional)

Check what resources will be created:

```bash
terraform plan
```

---

### 7️⃣ Apply the Terraform Configuration

To deploy the infrastructure:

```bash
terraform apply
```

When prompted, type `yes`.

---

### 8️⃣ Confirm SNS Email Subscription

After apply completes:

* Check your inbox for an AWS SNS confirmation email
* Click **“Confirm subscription”**

---

### 9️⃣ Test Monitoring (Optional)

Simulate risky activity:

* Login as root user
* Try to delete or stop CloudTrail

Then check:

| Resource              | Check For                    |
| --------------------- | ---------------------------- |
| **S3 Bucket**         | Log files being stored       |
| **CloudWatch Logs**   | Events streamed in real-time |
| **CloudWatch Alarms** | Alarm status (triggered?)    |
| **Email Inbox**       | SNS notification received?   |

---

### 🔟 Destroy Infrastructure (Cleanup)

If you need to remove the stack:

```bash
terraform destroy
```

Type `yes` when prompted.

---

## 🔐 Security Features

* ✅ S3 log encryption (AES256)
* ✅ Bucket versioning enabled
* ✅ IAM roles with minimum permissions
* ✅ CloudTrail across **all regions**
* ✅ CloudWatch Alarms for:

  * Root login
  * `StopLogging`
  * `DeleteTrail`

---

## 📌 Additional Tips

* Enable [KMS encryption](https://docs.aws.amazon.com/AmazonS3/latest/userguide/UsingKMSEncryption.html) for S3 for enhanced security
* Add more **metric filters** for actions like:

  * `CreateUser`
  * `AttachUserPolicy`
  * `PutBucketPolicy`
* To enable for **AWS Organizations**, set:

```hcl
is_organization_trail = true
```

---

## 📤 Terraform Outputs

After deployment, run:

```bash
terraform output
```

You’ll get:

* `cloudtrail_arn`
* `s3_bucket_name`
* `sns_topic_arn`

---

## 🧑‍💻 Maintainer

* **Author**: Your Name
* **Email**: [your.email@example.com](mailto:your.email@example.com)
* **License**: MIT (or any you choose)

---

Would you like me to package this as a downloadable `README.md` file or generate the Terraform code that matches this documentation?
