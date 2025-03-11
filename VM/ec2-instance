provider "aws" {
  region = "us-east-1"  # Specify the AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"  # Specify a valid AMI ID for the region
  instance_type = "t2.micro"  # Choose the instance type
  
  tags = {
    Name = "harness"
  }
}
