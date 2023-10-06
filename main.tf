terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = " 5.14.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
  access_key = "AKIA2Z3WSQQZ3FQWEPZV"
  secret_key = "swdOKkCTS/FLWubjqY8dkkE4FU6R3hSazjLTcTVP"
}
resource "aws_key_pair" "example_keypair" {
  key_name   = "example-keypair"
  public_key = "hello.rsa"  # Replace with your public key content
}

resource "aws_instance" "new_instance" {
  ami           = "ami-0c42696027a8ede58"  # Change this to your desired AMI
  instance_type = "t2.micro"
  key_name      = aws_key_pair.example_keypair.key_name
}

resource "local_file" "private_key" {
  filename = "c:/downloads/hello.rsa"
  content  = aws_key_pair.example_keypair.public_key  # Store public key content as private key
}
