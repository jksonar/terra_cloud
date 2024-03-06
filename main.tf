# login terraform cloud using command 
# terraform login

data "aws_ami" "redhat_ami" {
  most_recent = true
  filter {
    name   = "name"
    values = ["RHEL-9.3.0_HVM-20240117-x86_64-49-Hourly2-GP3"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["309956199498"]
}

resource "aws_instance" "example_server" {
  ami           = data.aws_ami.redhat_ami.id
  instance_type = "t2.micro"
  tags = {
    Name = "terraform-ec2"
  }
}