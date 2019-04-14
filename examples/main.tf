module "jenkins" {
  source            = "git::https://github.com/devopsplant/terraform-jenkins.git//module?ref=develop"
  outbound_internet = "true"
  cidr_block        = ["10.1.3.64/28", "10.1.3.80/28", "10.1.3.96/28"]
  environment       = "development"
  region            = "ap-southeast-2"
  key_name          = "jenkins"
  ssh_pub_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyVGaw1PuEl98f4/7Kq3O9ZIvDw2OFOSXAFVqilSFNkHlefm1iMtPeqsIBp2t9cbGUf55xNDULz/bD/4BCV43yZ5lh0cUYuXALg9NI29ui7PEGReXjSpNwUD6ceN/78YOK41KAcecq+SS0bJ4b4amKZIJG3JWmDKljtv1dmSBCrTmEAQaOorxqGGBYmZS7NQumRe4lav5r6wOs8OACMANE1ejkeZsGFzJFNqvr5DuHdDL5FAudW23me3BDmrCSJ5 your_username@hostname"
  }
  
