provider "aws" {

  region = "us-east-2"

}

variable vpc_id {}
variable ami_id {}
variable sg_id {}

data "aws_subnet_ids" "app" {

  vpc_id = "${var.vpc_id}"
  
  tags {
    type = "app"
  }

}


output "subnet_ids" {

  value = ["${data.aws_subnet_ids.app.*.ids}"]
}

resource "aws_instance" "multi-az-instance-launch-test" {

  count = 4
  ami = "${var.ami_id}"
  instance_type = "t2.micro"
  subnet_id = "${element(data.aws_subnet_ids.app.ids,count.index)}"
  #vpc_security_group_ids = ["${var.sg_id}"]
  key_name = "terraform-jd"

  root_block_device {

    volume_type = "gp2"
    volume_size = 10
    delete_on_termination = true

  }

  ebs_block_device {

    device_name = "/dev/sdg"
    volume_type = "gp2"
    volume_size = 10
    delete_on_termination = true

  }

  tags {

    Name = "kube-multiaz-poc-${format("%03d", count.index + 1)}"
  }

  user_data = "${file("mount_ebs.sh")}"
}


