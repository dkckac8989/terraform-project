
provider "aws" {
  region = "us-east-1"
}
#vpc
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "myvpc"
  }
}

#security group
resource "aws_security_group" "mysg" {
  name        = "mysg"
  description = "Allow HTTP and SSH traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  vpc_id = aws_vpc.myvpc.id
}
#internet gateway
resource "aws_internet_gateway" "myig" {
  vpc_id = aws_vpc.myvpc.id
}
#route table
resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myig.id
  }

  tags = {
    Name = "myroutetable"
  }
}

#instance
resource "aws_instance" "myinstance-1" {
  ami = "ami-00874d747dde814fa"
  instance_type = "t2.micro"
  security_groups =[aws_security_group.mysg.id]
  subnet_id = aws_subnet.publicsubnet.id
  key_name = "terrap"
  availability_zone = "us-east-1a"

  tags = {
    name = "project1"
    source = "terraform"
  }
}
resource "aws_instance" "myinstance-2" {
  ami = "ami-00874d747dde814fa"
  instance_type = "t2.micro"
  security_groups =[aws_security_group.mysg.id]
  subnet_id = aws_subnet.privatesubnet.id
  key_name = "terrap"
  availability_zone = "us-east-1b"

  tags = {
    name = "project2"
    source = "terraform"
  }
}

resource "aws_instance" "myinstance-3" {
  ami = "ami-00874d747dde814fa"
  instance_type = "t2.micro"
  security_groups =[aws_security_group.mysg.id]
  subnet_id = aws_subnet.publicsubnet.id
  key_name = "terrap"
  availability_zone = "us-east-1a"

  tags = {
    name = "project3"
    source = "terraform"
  }
}

#subnet
resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1a"
  tags = {
    Name = "publicsubnet"
  }
}
resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "us-east-1b"

  tags = {
    Name = "privatesubnet"
  }
}

  subnets= [aws_subnet.publicsubnet.id , aws_subnet.privatesubnet.id]

  enable_deletion_protection = false

  depends_on =[aws_instance.myinstance-1, aws_instance.myinstance-2, aws_instance.myinstance-3]
}
#route table association public
resource "aws_route_table_association" "publicsubnetass" {
  subnet_id = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.myroutetable.id

}
#route table private
resource "aws_route_table_association" "privatesubnetass" {
  subnet_id = aws_subnet.privatesubnet.id
  route_table_id = aws_route_table.myroutetable.id
}
#target group
resource "aws_lb_target_group" "mytargetgroup" {
  name     = "mytargetgroup"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.myvpc.id

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200,301,302"
  }
}


#Create a new listener

resource "aws_lb_listener" "mylistener" {
  load_balancer_arn = aws_lb.myloadbalancer.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.mytargetgroup.arn
}
}
#Listener rule
resource "aws_lb_listener_rule" "mylistener"{
  listener_arn = aws_lb_listener.mylistener.arn
  priority = 1

  action {
   type = "forward"
   target_group_arn = aws_lb_target_group.mytargetgroup.arn
  }

  condition {
     path_pattern {
    values = ["/"]

}
  }
}


#Attach the target group to the load balancer

resource "aws_lb_target_group_attachment" "mytargetgroupattachment1" {
  target_group_arn = aws_lb_target_group.mytargetgroup.arn
  target_id = aws_instance.myinstance-1.id
  port = "80"
}

resource "aws_lb_target_group_attachment" "mytargetgroupattachment2" {
  target_group_arn = aws_lb_target_group.mytargetgroup.arn
  target_id = aws_instance.myinstance-2.id
  port = "80"
}

resource "aws_lb_target_group_attachment" "mytargetgroupattachment3" {
  target_group_arn = aws_lb_target_group.mytargetgroup.arn
  target_id = aws_instance.myinstance-3.id
  port = "80"
}
#Route 53 hosted zone
resource "aws_route53_zone" "capitalapps" {
  name     = "capitalapps.me"
}
#route 53 nameservers
resource "aws_route53_record" "nameservers" {
  allow_overwrite = true
  name            = "capitalapps.me"
  ttl             = 3600
  type            = "NS"
  zone_id         = aws_route53_zone.capitalapps.zone_id

  records = aws_route53_zone.capitalapps.name_servers
}


#route 53 A record
resource "aws_route53_record" "record"{
  zone_id = aws_route53_zone.capitalapps.zone_id
  name = "terraform-test.capitalapps.me"
  type = "A"

  alias {
    name = aws_lb.myloadbalancer.dns_name
    zone_id = aws_lb.myloadbalancer.zone_id
    evaluate_target_health = true
  }
}
# Create a file to store the IP addresses of the instances
resource "local_file" "Ip_address" {
  filename = "host-inventory"
  content  = <<EOT
${aws_instance.myinstance-1.public_ip}
${aws_instance.myinstance-2.public_ip}
${aws_instance.myinstance-3.public_ip}
  EOT
}


#output

output "lb_target_group_arn"{
  value = aws_lb_target_group.mytargetgroup.arn
}

output "lb_load_balancer_dns_name"{
  value = aws_lb.myloadbalancer.dns_name
}

output "elastic_load_balancer_zone_id"{
  value = aws_lb.myloadbalancer.zone_id
}
