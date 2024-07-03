echo "updating system"
pacman -Syu
echo "installing basics"
pacman -S libvirt dnsmasq dmidecode cpio polkit qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
echo "starting libvirt"
systemctl enable libvirtd
systemctl start libvirtd
echo "installing noob gui xd"
pacman -S virt-manager 
echo "setting up qemu and libvirt"
echo 'uri_default = "qemu:///system"' | sudo tee -a /etc/libvirt/libvirt.conf
echo "cleaning up"
virsh net-start default
virsh net-autostart default
systemctl restart libvirtd
echo "done - make sure you enable vfio in grub!"
