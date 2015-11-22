# Infrastructure as Code full-stack AWS example
This is a demo setup to show how *Infrastructure as Code* can be implemented on AWS using
* [Terraform](https://terraform.io/intro/getting-started/build.html) for *setting up infrastructure*. Software Defined Network specifically the firewall rules (AWS security groups) and the ssh keys that should be used on the servers
* [Ansible](http://docs.ansible.com/ansible/) for *provisioning* the VM from a base image state to every configuration except the actual software package (which later is provided during deployment).  
* [Packer](https://www.packer.io/) for running the *builds of the VMs* (AMIs): We take a base VM and the ansible provisioning scripts and build a provisioned VM image.
* We use Ansible again to *start new VM instances* based on the images built by packer before and *deploy* the software (a Java Webapp as jar-file). For performance reasons we copy the jar at this point to the VM instance (and not put it already into the packer image).  
* Also a Demo Java Spring Boot Webapp is included under *webapp/* as demo app to be deployed.
