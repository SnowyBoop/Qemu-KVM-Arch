echo "updating system"
pacman -Syu
echo "installing basics"
pacman -Sy libvirt dnsmasq dmidecode cpio qemu polkit
echo "starting libvirt"
systemctl start libvirtd
echo "installing noob gui xd"
pacman -Syu virt-manager 
echo "setting up qemu and libvirt"
echo 'uri_default = "qemu:///system"' | sudo tee -a /etc/libvirt/libvirt.conf
echo "cleaning up"
virsh net-start default
virsh net-autostart default
systemctl restart libvirtd
echo "done :3"
