variable "awsvpc__tags" {
  type = map(string)

  default = {
    Name = "dnd-vpc-test"
    dnd  = "True"
  }
}
locals {
  aws_ec2_instance_tag = {
    Name           = "dnd-systest-ec2-iam-role"
    creator        = "auto"
    RedLockApiName = "aws-ec2-describe-instances"
    createdAt      = timestamp()
  }
}

locals {
  systest_ec2_instance_tag = {
    Name           = "systest-ec2-iam-role--${random_string.globalrandom4char.result}"
    creator        = "auto"
    RedLockApiName = "aws-ec2-describe-instances"
    yor_trace = "8cc1bbc4-85da-42b2-9b53-2f9cc0bf6f57"
    createdAt      = timestamp()
  }
}


locals {
  aws_security_group_tag = {
    Name           = "systest-sg-${random_string.globalrandom4char.result}"
    creator        = "auto"
    RedLockApiName = "aws-ec2-describe-security-groups"
    createdAt      = timestamp()
  }
}

data "aws_ami" "most_recent_amazon_linux_2" {
  owners = [
    "amazon",
  ]

  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn2-ami-hvm-2.0.??????????-x86_64-gp2",
    ]
  }

  filter {
    name = "state"

    values = [
      "available",
    ]
  }
}