## What's in this repo

This repo has the following folder structure:

* [root](https://github.com/devopsplant/terraform-jenkins/tree/master): The root folder contains an example
  of how to deploy Jenkins CI as a standalone component.
* [module](https://github.com/devopsplant/terraform-jenkins/tree/master/module): This folder contains the 
  main implementation code for this Module.
* [examples](https://github.com/devopsplant/terraform-jenkins/tree/master/examples): This folder contains 
  examples of how to use the module.

## components will be created when by using this module.

* EC2 instance with Jenkins installed on it and configured  to run on boot (Optionally can have Jenkins and the system Updated automatically)
* EBS volume to store the Jenkins data
* ALB to front the Jankins server and have a custom URL to access it.
* Security group to manage the access to Jenkins
* Subnets to be used by Jenkins (If you have your own subnets you can specify them).
* Lunch configuration for the EC2 instance.
* Autoscaling group to scale up and down the instance.
* Cloudwatch stream to push the logs to.


# terraform-jenkins
Terraform module to deploy Jenkins CI using launch configuration and behind loadbalancer
