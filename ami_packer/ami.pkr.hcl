
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "source_ami" {
  type    = string
  default = "ami-08c40ec9ead489470" # Ubuntu 22.04 LTS
}

variable "ssh_username" {
    type    = string
    default = "ubuntu"
}

variable "subnet_id"{
    type = string
    default = "subnet-0ade119d53f05c52e"
}

source "amazon-ebs" "my-ami" { 
    region = "${var.aws_region}"
    ami_name = "csye6225_${formatdate("YYYY_MM_DD_hh_mm_ss", timestamp())}"
    ami_description = "AMI for CSYE 6225"
    ami_regions = [
        "us-east-1",
    ]
    
    instance_type = "t2.micro"
    ami_users = [ "838931846632" ]
    source_ami = "${var.source_ami}"
    ssh_username = "${var.ssh_username}"
    subnet_id = "${var.subnet_id}"
  
    launch_block_device_mappings {
        delete_on_termination = true
        device_name           = "/dev/sda1"
        volume_size           = 50
        volume_type           = "gp2"
    }
}

build {
    sources = [ 
        "source.amazon-ebs.my-ami"
    ]

    provisioner "file" {
        source = "./WebAppDEV.zip"
        destination = "/home/${var.ssh_username}/WebAppDEV.zip"
    }

    provisioner "file" {
        source = "./webapp.service"
        destination = "/tmp/webapp.service"
    }

    provisioner "shell" {
        script = "./setup.sh"
    }

}
