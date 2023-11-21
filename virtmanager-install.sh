pacman -Syu libvirt dnsmasq dmidecode cpio 
systemctl start libvirtd
pacman -Syu virt-manager
echo 'uri_default = "qemu:///system"' | sudo tee -a /etc/libvirt/libvirt.conf
virsh net-start default
virsh net-autostart default
systemctl restart libvirtd
