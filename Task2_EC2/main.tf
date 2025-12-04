provider "aws" {
  region = "eu-north-1"
}

resource "aws_security_group" "web_sg" {
  name = "Akhil_Shukla_Web_SG"
  description = "Allow HTTP and SSH access for Web Server"

  vpc_id = "vpc-05dc5a4e363b18c09" 

  ingress {
    description = "HTTP Access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH Access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Akhil_Shukla_Web_SG"
  }
}

resource "aws_instance" "web_server" {
  ami = "ami-0fa91bc90632c73c9" 
  instance_type = "t3.micro"              
  key_name = "Akhil_Shukla_Key"      
  subnet_id = "subnet-0be57fab486ae0fa1" 
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              apt update
              apt install nginx -y
              echo "<html><h1>Resume of Akhil Shukla</h1></html>" > /var/www/html/index.html
              systemctl start nginx
              systemctl enable nginx
              EOF

  tags = {
    Name = "Akhil_Shukla_Web_Server"
  }
}