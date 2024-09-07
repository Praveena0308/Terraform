provider "aws" {
    region = "eu-central-1"
  
}
resource "aws_key_pair" "ssh-key" {
  key_name = "my-server-key"
  public_key = file("/home/praveena/.ssh/id_rsa.pub")
  
  }

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allow ssh inbound traffic"

    ingress {
        protocol = "tcp"
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        protocol = "-1"
        from_port = 0
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}
output "aws_instance" {
    value = aws_instance.my-server.public_ip
  
}


resource "aws_instance" "my-server" {
    ami = "ami-04f76ebf53292ef4d"
    instance_type = "t2.micro"
    key_name = aws_key_pair.ssh-key.key_name

    security_groups =  [aws_security_group.allow_ssh.name]

    tags = {
        Name = "my-instance"
    }
}