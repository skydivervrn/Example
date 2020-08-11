terraform {
  backend "s3" {
    bucket  = "terraform.example.skydiver.vrn"
    key     = "terraform"
    region  = "eu-west-1"
    encrypt = true
  }
}
