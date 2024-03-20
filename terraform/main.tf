terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "0.47.0"
    }
    onepassword = {
      source = "1Password/onepassword"
      version = "1.4.3"
    }
  }
}

provider "proxmox" {
  endpoint = "${var.proxmox_host}"
  username = "${var.proxmox_username}"
  password = "${var.proxmox_password}"
  tmp_dir  = "/var/tmp"
  ssh {
    username = "root"
    agent=true
  }
}

resource "proxmox_virtual_environment_vm" "homelab-demo" {
  count = 3
  name = "homelab-demo-${count.index + 1}"
  node_name = "m920q-01"
  vm_id = "42424${count.index + 1}"
  
  agent {
    enabled = true
    trim = true
  }

  initialization {
    datastore_id = "local-lvm"
    interface = "scsi2"
    user_account {
      username = "terraform"
      keys = ["${var.ssh_key}"]
    }
    ip_config {
      ipv4 {
        address = "${var.address}${count.index + 1}/23"
        gateway = "${var.gateway}"
      }
    }
  }

  operating_system {
    type = "l26"
  } 

  cpu {
    cores = 2
    sockets = 1
    type = "x86-64-v2-AES"
    architecture = "x86_64"
  }

  memory { 
    dedicated = 8192
  }

  scsi_hardware = "virtio-scsi-pci"

  disk {
    datastore_id = "local-lvm"
    file_id      = "${var.ubuntu_img}"
    interface    = "scsi0"
    file_format = "raw"
    size = 30
    ssd = true
  }

  network_device {
    model = "virtio"
    bridge = "vmbr1"
  }

  boot_order = ["scsi0"]

  lifecycle {
    ignore_changes = [
      network_device,tags,
    ]
  }
 
}