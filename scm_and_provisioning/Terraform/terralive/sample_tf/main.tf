provider "aws" {
  region = "us-east-2"
}

module "module1" {

  source = "modules/"
  var1 = 1
}
