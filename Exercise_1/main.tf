# Designate a cloud provider, region, and credentials

provider "aws" {
  profile = "default"
  region = "eu-west-1"
}

# provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "UdacityT2" {
  ami           = "ami-0ffea00000f287d30"
  instance_type = "t2.micro"
  
  subnet_id     =  "subnet-b86a74ce"

  count         = 4
  tags = {
    Name = "Udacity T2"
  }
}

# provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "UdacityM4" {
  ami           = "ami-0ffea00000f287d30"
  instance_type = "m4.large"
  
  subnet_id     =  "subnet-b86a74ce"

  count         = 2
  tags = {
    Name = "Udacity M4"
  }
}
