# Infrastructure as Code full-stack AWS example
This is a demo setup to show how *Infrastructure as Code* can be implemented on AWS using
* [Terraform](https://terraform.io/intro/getting-started/build.html) for *setting up infrastructure*. Software Defined Network specifically the firewall rules (AWS security groups) and the ssh keys that should be used on the servers
* [Ansible](http://docs.ansible.com/ansible/) for *provisioning* the VM from a base image state to every configuration except the actual software package (which later is provided during deployment).  
* [Packer](https://www.packer.io/) for running the *builds of the VMs* (AMIs): We take a base VM and the ansible provisioning scripts and build a provisioned VM image.
* We use Ansible again to *start new VM instances* based on the images built by packer before and *deploy* the software (a Java Webapp as jar-file). For performance reasons we copy the jar at this point to the VM instance (and not put it already into the packer image).  
* [Vagrant](https://www.vagrantup.com/) to be able to fire up a VM locally and test the provisioning locally
* Also a Demo Java Spring Boot Webapp is included under *webapp/* as demo app to be deployed.

## Prerequisites
You need an AWS account but can use your inital free quota to test the demo. All scripts that need access to AWS EC2 need the respective environment variables AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY set before. 
A couple of tools have to be installed before the actual demo can fully be run from a linux box (or VM itself):
* [Terraform](https://terraform.io/intro/getting-started/build.html) 
* [Ansible](http://docs.ansible.com/ansible/) and the apt package "python-boto" for the support of the EC2 module
* [Packer](https://www.packer.io/) 
* [Vagrant](https://www.vagrantup.com/)
* [Virtualbox](https://www.virtualbox.org/)

I recommend you download the current versions of the tools directly put them e.g. under /opt/ and add their bin sub directories to your path in *.bashrc*

## Other Material
* Check the [video](https://youtu.be/AiAOLpshguM) showing the usage of the scripts. 
* Check the [slides](http://de.slideshare.net/davidvoelkel/infrastructure-as-code-for-beginners) of the related XP Days Germany 2015 Session ["Infrastructure as Code" for Beginners](http://www.xpdays.de/2015/sessions/088-infrastructure-as-code-fuer-anfaenger.html)    

## Disclaimer
I guarantee for nothing but please as a PR if I can improve this documentation. For the ease of use I had put an SSH private key into the demo, so in case you want to build up further, please change the keys from the example and don't check in the private key into a public repository. 
