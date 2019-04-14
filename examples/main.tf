module "jenkins" {
  source            = "git::https://github.com/devopsplant/terraform-jenkins.git//module?ref=develop"
  outbound_internet = "true"
  vpc_id            = "vpc-7022710000"
  }
  
