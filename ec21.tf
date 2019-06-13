provider "aws" {
  access_key = "Access Key"
  secret_key = "Secret Key"
  region     = "us-east-1"
}

resource "aws_instance" "test" {
count = 3
  ami           = "ami-03cea42335e3d43a8"
  instance_type = "t2.micro"
  key_name = "Terraform-Key"
  security_groups = ["${aws_security_group.allow_rdp.name}"]

}

resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "Allow rdp traffic"


  ingress {

    from_port   = 3389 #  By default, the windows server listens on TCP port 3389 for RDP
    to_port     = 3389
    protocol =   "tcp"

    cidr_blocks =  ["0.0.0.0/0"]
  }
}
