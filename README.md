Steps for deploy(From terraform folder):

Create an s3 bucket and pass it to terraform remote backend in backend.tf file
Create file terraform.tfvars and provide necessary variables
```
user_key_pair = "" //as data of public key
trusted_ipv4_cidr_blocks = "" // as list of cidr blocks ["1.1.1.1/32"]
```
From terraform folder execute terraform apply
Steps for deploy(From ansible folder):

export AWS_ACCESS_KEY_ID=XXXXXX
export AWS_SECRET_ACCESS_KEY=XXXXXXX
