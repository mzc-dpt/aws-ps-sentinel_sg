resource "aws_security_group" "example" {
  # vpc_id = aws_vpc.vpc-test-stn.id
  name   = "example"
  description = "Example security group for EC2 instances"

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    
    ## 보안 취약점: 인터넷에 대한 액세스를 제어하지 않음
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["192.168.0.0/16"]
    description = "Allow inbound traffic on port 8081"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    
    # cidr_blocks = ["0.0.0.0/0"]
    cidr_blocks = ["192.168.0.0/16"]
    description = "Allow all outbound traffic"
  }
}