provider "aws" {
  region  = "eu-west-1"
  profile = "default"
  shared_credentials_file = "/Users/alex/.aws/credentials"
  version = "~> 3.0"
}
