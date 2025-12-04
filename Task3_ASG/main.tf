provider "aws" {
  region = "eu-north-1"
}

resource "aws_launch_template" "app_lt" {
  name_prefix = "Akhil-Shukla-Template"
  image_id = "ami-0fa91bc90632c73c9"
  instance_type = "t3.micro"
  key_name = "Akhil_Shukla_Key"
  vpc_security_group_ids = ["sg-0f142a396bf40d079"]

  user_data = base64encode(<<-EOF
              #!/bin/bash
              apt update
              apt install nginx -y
              echo "<html><h1>Resume of Akhil Shukla (Auto Scaled)</h1></html>" > /var/www/html/index.html
              systemctl start nginx
              systemctl enable nginx
              EOF
  )

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Akhil_Shukla_ASG_Instance"
    }
  }
}

resource "aws_lb_target_group" "app_tg" {
  name = "Akhil-Shukla-TG"
  port = 80
  protocol = "HTTP"
  vpc_id = "vpc-05dc5a4e363b18c09"

  health_check {
    path = "/"
    healthy_threshold = 2
    unhealthy_threshold = 10
  }
}

resource "aws_lb" "app_alb" {
  name = "Akhil-Shukla-ALB"
  internal = false
  load_balancer_type = "application"
  security_groups = ["sg-0f142a396bf40d079"]
  subnets = [
    "subnet-0be57fab486ae0fa1",
    "subnet-0a9c2048f57a1c084"
  ]
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.app_alb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

resource "aws_autoscaling_group" "app_asg" {
  name = "Akhil-Shukla-ASG"
  desired_capacity = 2
  max_size = 4
  min_size = 1
  vpc_zone_identifier = [
    "subnet-023db67d7c3dd7ee1",
    "subnet-042e6fb9fcb1738e0"
  ]
  target_group_arns = [aws_lb_target_group.app_tg.arn]

  launch_template {
    id = aws_launch_template.app_lt.id
    version = "$Latest"
  }
}