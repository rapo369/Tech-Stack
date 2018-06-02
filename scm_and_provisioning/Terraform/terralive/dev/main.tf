

provider "aws" {

  region = "${aws_region}"
}

data "aws_availability_zones" "all" {}


module "network" {

  source = "../modules/network"

}


module "app" {

  source = "../modules/app"


}



