#cloud-config

package_update: true

packages:
 - python-dev
 - libssl-dev 
 - python-pip 

package_upgrade: true

power_state:
 mode: poweroff
 condition: True
