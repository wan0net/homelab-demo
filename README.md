This repo has been written for the CrikeyCon 2024 talk "Lets take these results to the (home)lab(rador). This presentation is available at https://wan0.net/about/

NOTE: This is somewhat thrown together and does not follow best practice in a number of respects (ignoring host key checking, embedding a password in an tfvars file). Use this as an opportunity to question the decisions and commands I've used, and with googling to determine the best way to do it for you.

NOTE: *DO NOT EMAIL THE AUTHOR SAYING IT DOES NOT WORK*. The intent of this exercise is to understand the thought processes required for a homelab. Looking up the libraries that are used, and their pre-requisites. I can guarantee no project on the internet will "just work" and you need to tailor it to your environment and tools.

# Rough Instructions
1. prereq.sh is a file to install all pre-requisite libraries and tools. It is written for Ubuntu 22.04. Run this first.
2. Follow the intructions in ./image/create-ubuntu-image.sh to generate an ubuntu image with qemu-guest-agent installed. Upload this to a share on your Proxmox server.
4. Create a vars.tf file in the terraform folder. You will need to include the following:
```
variable "ssh_key" {
  default = "<Public SSH Key>"
}
variable "proxmox_username" {
  default = "<Proxmox Username>"
}

variable "proxmox_password" {
  default = "<Proxmox Password>"
}

variable "proxmox_host" {
  default = "<Proxmox Host>"
}

variable "address" {
 default = "<Start of IP address range to use (needs 3 spare IPs)>"
}

variable "gateway" {
  default = "<Your Gateway IP address>"
}

variable "ubuntu_img" {
  default = "filestore:iso/filename.img"
}
```
4. Modify k0sctl-prod.yaml with the IP address you have defined in the vars.tf file.
5. run.sh!
