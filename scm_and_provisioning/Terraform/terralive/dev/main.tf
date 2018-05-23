

provider "aws" {

  region = "${aws_region}"
}

data "aws_availability_zones" "all" {}


module "network" {

  source = "https://github.com/jp19214/terramodules.git//modules/network?ref=v0.0.1"

}


module "app" {

  source = "https://github.com/jp19214/terramodules.git//modules/app?ref=v0.0.1"


}



