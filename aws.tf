
provider "aws" {
    #access_key = "set AWS_ACCESS_KEY_ID environment variable"
    #secret_key = "set AWS_SECRET_ACCESS_KEY environment variable"
    region = "eu-central-1"
}

resource "aws_instance" "example" {
    ami = "ami-accff2b1"
    instance_type = "t2.micro"
}
