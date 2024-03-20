# Download Ubuntu cloudimg - minimal
wget https://cloud-images.ubuntu.com/minimal/releases/jammy/release/ubuntu-22.04-minimal-cloudimg-amd64.img -O ../temp/ubuntu-cloudimg-amd64.img

# Install libguestfs-tools. If you are using WSL you will need linux-image-generic as well else it will not work.
sudo apt-get install libguestfs-tools linux-image-generic

#You need to enable access to the boot modules. Basically, qemu boots a new VM just to install the package.
sudo chmod go+r /boot/vmlinuz-*

# Install qemu-guest-agent on Ubuntu image.
virt-customize -a ubuntu-cloudimg-amd64.img --install qemu-guest-agent