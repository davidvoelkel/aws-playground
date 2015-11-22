
provider "aws" {
    #access_key = "set AWS_ACCESS_KEY_ID environment variable"
    #secret_key = "set AWS_SECRET_ACCESS_KEY environment variable"
    region = "eu-central-1"
}

resource "aws_security_group" "webservers" {
  name = "webservers"
  description = "Allow SSH and 8080 Web inbound and all outbound traffic"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 8080
      to_port = 8080
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "webserver_key" {
  key_name = "webserver_key" 
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC1sX+PRSGYYkPCQTupFalbyKB2V5LYocm+obrtGvm1iE7RnWcIYHiyhYdoa3ofVbyT7Vehqtn1/FOyBQW9eFCX4O/EB2MZ5jR5mHa2NE2WAna3KLaRUokvAcfSScAXu81YOFe3YWfsA8VJGNZj5M4hnJlUjtjHW0dXb4LJwWsWR+zJy3mZpFfEG5LgnUkM8Bt0+OcR3s/POoagrW0S7zNQisVZeWsXMF1b/BTWreUmeur6J1MsKVxD/H4SS/zUNniiAqYSSIySHts6+SwySq04DGu9ljyEyWU/NSPJL5aDvsvaTNdBB+dZIyHnOGGOVkEuIFitl36nuSmLAIWk0ntV david@david-Latitude-E6420"
}

resource "aws_instance" "example" {
    ami = "ami-a4e7f5c8"
    instance_type = "t2.micro"
    key_name = "webserver_key"
    security_groups = ["webservers"]
}


