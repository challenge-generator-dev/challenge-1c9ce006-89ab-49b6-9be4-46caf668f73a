# Módulo de cómputo para el servicio de notificaciones
# Define instancias EC2, ECS o Lambda según la configuración

# Datos de AMI - Ubuntu 22.04 LTS
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

# Security Group adicional para compute
resource "aws_security_group" "compute" {
  name        = "${var.project}-compute-sg"
  description = "Security group para recursos de cómputo"
  vpc_id      = var.vpc_id

  ingress {
    description     = "HTTP desde VPC"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  ingress {
    description     = "HTTPS desde VPC"
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    security_groups = [var.alb_security_group_id]
  }

  egress {
    description = "Salida a internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.common_tags
}

# Instance Profile para EC2
resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project}-ec2-profile"
  role = var.ec2_role_name
  tags = var.common_tags
}

# Launch Template para Auto Scaling Group
resource "aws_launch_template" "notifications" {
  name_prefix   = "${var.project}-"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  iam_instance_profile {
    arn = aws_iam_instance_profile.ec2_profile.arn
  }

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.compute.id]
    subnet_id                   = var.private_subnet_ids[0]
  }

  user_data = base64encode(templatefile("${path.module}/userdata.sh", {
    environment = var.environment
    app_version = var.app_version
  }))

  tag_specifications {
    resource_type = "instance"
    tags = merge(var.common_tags, {
      Name = "${var.project}-instance"
    })
  }

  monitoring {
    enabled = true
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = var.common_tags
}

# Auto Scaling Group
resource "aws_autoscaling_group" "notifications" {
  name                = "${var.project}-asg"
  vpc_zone_identifier = var.private_subnet_ids
  desired_capacity    = var.desired_capacity
  min_size            = var.min_size
  max_size            = var.max_size

  launch_template {
    id      = aws_launch_template.notifications.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.project}-asg-instance"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }
}

# ALB para el servicio de notificaciones
resource "aws_lb" "notifications" {
  name               = "${var.project}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.alb_security_group_id]
  subnets            = var.public_subnet_ids

  enable_deletion_protection = var.environment == "prod" ? true : false

  tags = var.common_tags
}

# Target Group para el ALB
resource "aws_lb_target_group" "notifications" {
  name     = "${var.project}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/health"
    matcher             = "200"
  }

  tags = var.common_tags
}

# Listener del ALB
resource "aws_lb_listener" "notifications" {
  load_balancer_arn = aws_lb.notifications.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.notifications.arn
  }
}

# Attachment de ASG al Target Group
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_id = aws_autoscaling_group.notifications.id
  lb_target_group_arn  = aws_lb_target_group.notifications.arn
}