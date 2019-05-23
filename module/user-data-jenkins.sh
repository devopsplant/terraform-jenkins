#!/bin/bash

yum update -y


yum install -y jenkins java-1.8.0-openjdk
yum remove -y java-1.7.0-openjdk

reboot