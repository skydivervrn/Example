data "terraform_remote_state" "main" {
  backend = "s3"
  config = {
    bucket  = "terraform.example.skydiver.vrn"
    key     = "terraform"
    region  = "eu-west-1"
    encrypt = true
    profile = "home"
  }
}

