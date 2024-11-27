echo "updating system"
pacman -Syu
echo "installing basics"
pacman -S libvirt dnsmasq dmidecode cpio polkit qemu-full qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager virt-firmware
echo "starting libvirt"
systemctl enable libvirtd
sleep 1
systemctl start libvirtd
sleep 1
echo "installing noob gui xd"
pacman -S virt-manager 
echo "setting up qemu and libvirt"
echo 'uri_default = "qemu:///system"' | sudo tee -a /etc/libvirt/libvirt.conf
sleep 1
echo "cleaning up"
virsh net-start default
sleep 2
virsh net-autostart default
sleep 1
systemctl restart libvirtd
echo "done - make sure you enable vfio in grub!"
