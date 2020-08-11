terraform {
  backend "s3" {
    bucket  = "terraform.example.skydiver.vrn"
    key     = "projects/tg-bot"
    region  = "eu-west-1"
    encrypt = true
  }
}
