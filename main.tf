terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "vm" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name      = var.vm_name
    CreatedBy = "ServiceNow"
    TicketRef = var.ticket_number
  }
}

output "instance_id" {
  value = aws_instance.vm.id
}
