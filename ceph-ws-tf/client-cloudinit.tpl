#cloud-config

package_update: true

packages:
 - python-dev
 - libssl-dev 
 - python-pip 
 - qemu-utils 
 - virt-manager
 - qemu-system
 - libvirt-bin
 - gir1.2-spice-client-gtk-2.0 
 - gir1.2-spice-client-gtk-3.0

package_upgrade: true

power_state:
 mode: poweroff
 condition: True
