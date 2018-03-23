
terraform {

  backend "s3" {
    bucket = "tfmstatestore"
    key = "ignite-test"
    region = "us-east-1"
    #role_arn = "arn:aws:iam::630527842429:role/terraform-jd"

  }

}


provider "aws" {

	region = "us-east-2"

}

resource "aws_instance" "kubetest" {

	ami = "ami-5eb1843b"
	instance_type = "t2.micro"
	count = "0"
	
	tags {
	
	Name = "kubetest"
	
	}

}
