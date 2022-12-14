
terraform {
    backend "s3" {
        bucket         = "gorponbanjoshark"
        key            = "global/s3/terraform.tfstate"
        region         = "us-east-2"

        dynamodb_table = "gorponbanjoshark"
        encrypt        = true
    }
}