
resource "aws_instance" "example" {

  ami = "ami-5eb1843b"
  instance_type = "t2.micro"
  
  user_data = <<-EOF
                 #!/bin/bash
                 echo "Hello, World" > index.html
                 nohup busybox httpd -f -p 8080 &
                 EOF
  

}
