module "jenkins" {
  source            = "https://github.com/devopsplant/terraform-jenkins/tree/develop/module/"
  project           = "jenkins"
  owner             = "devopsplant"
  provisioned_by    = "terraform"
  role              = "jenkins"
  instance_type     = "t3.tiny"
  ssh_allowed_cidr  = ["0.0.0.0/0"]
  allowed_cidr      = ["0.0.0.0/0"]
  outbound_internet = "true"
  vpc_id            = "vpc-31c7c755"
  cidr_block        = ["10.1.3.64/28", "10.1.3.80/28", "10.1.3.96/28"]
  environment       = "cicd"
  region            = "sydney"
  key_name          = "jenkins"
  webproxy_cidr     = "0.0.0.0/0"
  }
  