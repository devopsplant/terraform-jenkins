module "jenkins" {
  source            = "git::https://github.com/devopsplant/terraform-jenkins.git//module?ref=develop"
  #cidr_block = ["10.1.3.64/28", "10.1.3.80/28", "10.1.3.96/28","10.1.3.128/28"]
  }
  