provider "aws" {

  region = "us-east-1"

}


resource "aws_instance" "python-jenkins" {

  count = 1
  ami = "ami-4bf3d731"
  instance_type = "t2.small"
  subnet_id = "subnet-eaf6abb0"
  vpc_security_group_ids = ["sg-45aa8535"]
  key_name = "haaDev001"

  root_block_device {

  volume_type = "gp2"
  volume_size = 20
  delete_on_termination = true

  }

  ebs_block_device {

  device_name = "/dev/sdg"
  volume_type = "gp2"
  volume_size = 100
  delete_on_termination = true

  }

  tags {

  Name = "python-jenkins"

  }

  user_data = "${file("mount_ebs.sh")}"
}


